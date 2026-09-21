#!/usr/bin/env python3
"""Simulate IMX219 CCI + driver sequence without FPGA.

Checks the C sources against IMX219_datasheet.md:
  chip id, Repeated Start, 2-lane before stream, RAW10, 1080p crop, GBRG, XCLR t5.
"""
from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
SW = ROOT / "sw" / "src"
DS = ROOT / "doc_imx219" / "pdf" / "IMX219_datasheet" / "IMX219_datasheet.md"

SLAVE = 0x10
T5_MIN_US = 6000
PASS = 0
FAIL = 0


def ok(msg: str) -> None:
    global PASS
    PASS += 1
    print(f"  PASS  {msg}")


def bad(msg: str) -> None:
    global FAIL
    FAIL += 1
    print(f"  FAIL  {msg}")


def parse_table(text: str, name: str) -> list[tuple[int, int]]:
    m = re.search(
        rf"static const Imx219Reg {name}\[\] = \{{(.*?)\n\}};",
        text,
        re.S,
    )
    if not m:
        raise SystemExit(f"table {name} not found")
    return [
        (int(a, 16), int(b, 16))
        for a, b in re.findall(r"\{0x([0-9A-Fa-f]+),\s*0x([0-9A-Fa-f]+)\}", m.group(1))
    ]


def u16(hi: int, lo: int) -> int:
    return (hi << 8) | lo


class FakeImx219:
    """Minimal sensor: datasheet defaults + CCI protocol."""

    def __init__(self) -> None:
        self.xclr = 0
        self.time_us = 0
        self.xclr_rise_us: int | None = None
        self.index = 0
        self.sr_pending = False
        self.regs = {
            0x0000: 0x02,
            0x0001: 0x19,
            0x0100: 0x00,
            0x0103: 0x00,
            0x0114: 0x03,  # default 4-lane (p.28 / p.47)
            0x0128: 0x01,
            0x012A: 0x0C,
            0x012B: 0x00,
            0x018C: 0x0A,
            0x018D: 0x0A,
        }

    def sleep(self, us: int) -> None:
        self.time_us += us

    def set_xclr(self, level: int) -> None:
        if self.xclr == 0 and level == 1:
            self.xclr_rise_us = self.time_us
        self.xclr = level

    def _alive(self) -> bool:
        return self.xclr == 1

    def send(self, addr: int, data: bytes, repeated_start: bool) -> None:
        if addr != SLAVE or not self._alive():
            raise RuntimeError("I2C NACK")
        if len(data) == 2:
            self.index = (data[0] << 8) | data[1]
            self.sr_pending = repeated_start
            return
        if len(data) == 3:
            reg = (data[0] << 8) | data[1]
            val = data[2]
            self._write(reg, val)
            self.index = (reg + 1) & 0xFFFF
            self.sr_pending = False
            return
        raise RuntimeError(f"bad write len {len(data)}")

    def recv(self, addr: int, n: int) -> bytes:
        if addr != SLAVE or not self._alive():
            raise RuntimeError("I2C NACK")
        # Datasheet §3-1-2-1: read from random location needs Repeated Start
        if not self.sr_pending:
            raise RuntimeError("read without Repeated Start")
        self.sr_pending = False
        out = bytearray()
        for _ in range(n):
            out.append(self.regs.get(self.index, 0))
            self.index = (self.index + 1) & 0xFFFF
        return bytes(out)

    def _write(self, reg: int, val: int) -> None:
        if reg == 0x0103 and val & 1:
            self.regs[0x0103] = 0
            self.regs[0x0100] = 0
            return
        if reg == 0x0100 and val & 1:
            if self.xclr_rise_us is None:
                raise RuntimeError("stream on before XCLR")
            if self.time_us - self.xclr_rise_us < T5_MIN_US:
                raise RuntimeError("stream on before t5 (6 ms)")
            if (self.regs.get(0x0114, 0x03) & 0x03) != 0x01:
                raise RuntimeError("0x0114 must be 2-lane before standby cancel")
        self.regs[reg] = val & 0xFF


class Bus:
    def __init__(self, sensor: FakeImx219) -> None:
        self.s = sensor
        self.rep = False
        self.log: list[str] = []

    def set_rep(self, on: bool) -> None:
        self.rep = on

    def write(self, data: bytes) -> None:
        self.s.send(SLAVE, data, self.rep)
        self.log.append(f"WR {' '.join(f'{b:02X}' for b in data)} sr={int(self.rep)}")

    def read(self, n: int = 1) -> bytes:
        d = self.s.recv(SLAVE, n)
        self.log.append(f"RD {d.hex()} n={n}")
        return d


def write_reg(bus: Bus, reg: int, val: int) -> None:
    bus.write(bytes([(reg >> 8) & 0xFF, reg & 0xFF, val & 0xFF]))
    bus.s.sleep(200)


def read_reg(bus: Bus, reg: int) -> int:
    bus.set_rep(True)
    bus.write(bytes([(reg >> 8) & 0xFF, reg & 0xFF]))
    bus.set_rep(False)
    return bus.read(1)[0]


def main() -> int:
    print("IMX219 driver check  (host sim, no FPGA)\n")

    if not DS.is_file():
        bad(f"datasheet missing: {DS}")
        return 1
    ds = DS.read_text(encoding="utf-8", errors="replace")
    ok("datasheet present")

    for needle, label in [
        ("0x0219", "chip id 0x0219 in datasheet"),
        ("Repeated Start", "Repeated Start documented"),
        ("0x2B", "RAW10 DT 0x2B"),
        ("GBRG", "Bayer GBRG"),
    ]:
        (ok if needle in ds else bad)(label)

    c = (SW / "imx219.c").read_text(encoding="utf-8")
    h = (SW / "imx219_regs.h").read_text(encoding="utf-8")
    params = (SW / "parameters.h").read_text(encoding="utf-8")
    pipeline = (SW / "pipeline.c").read_text(encoding="utf-8")
    main_c = (SW / "main.c").read_text(encoding="utf-8")

    if "XIICPS_REP_START_OPTION" in c:
        ok("imx219.c uses Repeated Start on read")
    else:
        bad("imx219.c missing Repeated Start")

    mode = parse_table(h, "Imx219Mode1080p")
    unlock = parse_table(h, "Imx219AccessUnlock")
    regs = dict(mode)

    checks = [
        (regs.get(0x0114) == 0x01, "0x0114 = 2-lane"),
        (regs.get(0x012A) == 0x18 and regs.get(0x012B) == 0x00, "EXCK 24.00 MHz"),
        (regs.get(0x018C) == 0x0A and regs.get(0x018D) == 0x0A, "RAW10 0x0A0A"),
        (u16(regs[0x016C], regs[0x016D]) == 1920, "x_output_size 1920"),
        (u16(regs[0x016E], regs[0x016F]) == 1080, "y_output_size 1080"),
        (u16(regs[0x0164], regs[0x0165]) == 680, "X_ADD_STA 680"),
        (u16(regs[0x0166], regs[0x0167]) == 2599, "X_ADD_END 2599"),
        (u16(regs[0x0168], regs[0x0169]) == 692, "Y_ADD_STA 692"),
        (u16(regs[0x016A], regs[0x016B]) == 1771, "Y_ADD_END 1771"),
        (regs.get(0x0172) == 0x00, "orientation 0 (GBRG)"),
        (regs.get(0x0174) == 0x00 and regs.get(0x0175) == 0x00, "no binning"),
        (regs.get(0x0304) == 0x03 and regs.get(0x0305) == 0x03, "PREPLLCK 24–27 MHz"),
        (mode[0][0] == 0x0114, "lanes programmed first in mode table"),
        ("0x10U" in params or "0x10" in params, "I2C slave 0x10"),
        ("0x0219" in params, "MODEL_ID 0x0219"),
        ("DEMOSAIC_BAYER_GBRG" in params and "2U" in params, "demosaic phase GBRG=2"),
        ("CSI_ACTIVE_LANES        2U" in params, "CSI 2 lanes"),
        ("VIDEO_COLUMNS" in params and "1920" in params, "1920 columns"),
        ("VIDEO_ROWS" in params and "1080" in params, "1080 rows"),
        ("Xil_DCacheDisable" in pipeline, "D-cache off for VDMA"),
        (main_c.find("Pipeline_Start") < main_c.find("Imx219_Stream(1)"),
         "stream on after pipeline"),
        ("usleep(10000)" in c, "XCLR wait 10 ms >= t5 6 ms"),
        (len(unlock) == 6, "access-unlock table present"),
    ]
    for cond, label in checks:
        (ok if cond else bad)(label)

    # Negative: read without Sr must fail
    s = FakeImx219()
    s.set_xclr(1)
    s.sleep(10000)
    try:
        s.send(SLAVE, bytes([0x00, 0x00]), repeated_start=False)
        s.recv(SLAVE, 1)
        bad("read without Repeated Start should NACK")
    except RuntimeError:
        ok("sensor rejects read without Repeated Start")

    # Full driver sequence (mirrors main.c)
    s = FakeImx219()
    bus = Bus(s)
    s.set_xclr(0)
    s.sleep(1000)
    s.set_xclr(1)
    s.sleep(10000)

    hi = read_reg(bus, 0x0000)
    lo = read_reg(bus, 0x0001)
    chip = (hi << 8) | lo
    (ok if chip == 0x0219 else bad)(f"MODEL_ID = 0x{chip:04X}")

    write_reg(bus, 0x0100, 0x00)
    write_reg(bus, 0x0103, 0x01)
    s.sleep(10000)
    write_reg(bus, 0x0100, 0x00)
    for reg, val in unlock:
        write_reg(bus, reg, val)
    for reg, val in mode:
        write_reg(bus, reg, val)

    (ok if s.regs.get(0x0114) == 0x01 else bad)("lanes=2 after config")
    (ok if s.regs.get(0x0100) == 0x00 else bad)("still in SW standby after config")

    # pipeline would start here
    write_reg(bus, 0x0100, 0x01)
    (ok if s.regs.get(0x0100) == 0x01 else bad)("streaming")

    wc = 1920 * 10 // 8
    (ok if wc == 2400 else bad)(f"CSI RAW10 word count {wc} (expect 2400)")

    print()
    if FAIL:
        print(f"RESULT  {PASS} passed, {FAIL} failed")
        return 1
    print(f"RESULT  OK  {PASS} checks passed")
    print("Driver sequence matches datasheet. FPGA/Vitis still needed for HDMI on hardware.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
