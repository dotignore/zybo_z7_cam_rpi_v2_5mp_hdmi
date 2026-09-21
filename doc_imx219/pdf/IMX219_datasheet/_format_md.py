"""Rebuild IMX219_datasheet.md: formatted text + page PNGs (original look)."""
from __future__ import annotations

import re
from pathlib import Path

import pymupdf

here = Path(__file__).resolve().parent
src = here / "IMX219_datasheet_Quectel.pdf"
if not src.exists():
    src = here.parent / "IMX219_datasheet_Quectel.pdf"
out = here / "IMX219_datasheet.md"

SKIP_FOOTER = re.compile(r"^(IMX219PQH5-C|E13Y12F44|\d{1,3})$")
SECTION = re.compile(r"^(\d+(?:\-\d+)*)\s{1,4}(\S.*)$")
FIG_CAP = re.compile(r"^(Fig\.\s*\d+\b.*)$", re.I)
TBL_CAP = re.compile(r"^(Table\s+\d+\b.*)$", re.I)
BULLET = re.compile(r"^[◆♦●•]\s*")
FIGURE_CELL = {"FS", "FE", "PH", "PF", "SDA", "SCL", "ADC", "INCK"}

QUICK_INDEX = """\
# IMX219PQH5-C — Sony / Quectel datasheet

Source: `IMX219_datasheet_Quectel.pdf` · 96 pages · page images `imx219_ds_pNNN.png` (200 DPI)

Project mode to check against: **1920×1080 RAW10 Bayer GBRG, 2-lane CSI-2, 30 fps**.

Each section below starts with the **original page image**, then searchable formatted text.

## Quick index

| What | Pages |
|------|-------|
| Chip, 2/4-lane CSI-2, 60 fps @1080p V-crop, max 912 Mbps/lane @2-lane | [1](#page-1) |
| Pins / MIPI D0 D1 CLK | [10](#page-10)–[16](#page-16) |
| I2C / CCI, Repeated Start, slave address | [17](#page-17)–[23](#page-23) |
| Register map areas | [24](#page-24)–[26](#page-26) |
| Chip ID `0x0000` = `0x0219` | [26](#page-26) |
| Streaming `0x0100`, CSI lanes `0x0114` (01=2-lane, 03=4-lane), EXCK `0x012A/B` | [28](#page-28) |
| Frame bank A: `FRM_LENGTH` `LINE_LENGTH` crop `0x0164+` format `0x018C/D` | [30](#page-30) |
| PLL / clock regs `0x0300–0x030D` | [33](#page-33) |
| CSI-2 frame: FS=`0x00` FE=`0x01` | [47](#page-47) |
| CSI DT: RAW8=`0x2A` (`0x0808`), **RAW10=`0x2B` (`0x0A0A`)** | [49](#page-49) |
| RAW10 packing / embedded data | [50](#page-50) |
| Array 3280×2464 active / 3296×2480 effective | [52](#page-52) |
| Binning (1080p = no binning, V-crop) | [53](#page-53) |
| Image size / readout / flip (Bayer order) | [54](#page-54)–[55](#page-55) |
| Frame-rate formula, shutter, gain | [56](#page-56) |
| Test pattern | [62](#page-62) |
| Power on / off | [77](#page-77) |
| PLL / INCK / EXCK_FREQ | [81](#page-81)–[82](#page-82) |
| Color filter / readout | [89](#page-89) |

Key facts:

- `0x0114` = `0x01` → 2-lane (set **before** leaving standby). Default is 4-lane (`0x03`).
- `0x018C/0x018D` = `0x0A/0x0A` → CSI DT **0x2B RAW10**. Word count = width × 10/8.
- FS short packet DT=`0x00`, FE DT=`0x01`.
- 1080p is **V-crop**; datasheet max is **60 frame/s @1080p**. RPi/Quectel 1080p30 is slower clocking of that crop.
- I2C 16-bit index + 8-bit data; **read requires Repeated Start** (§3-1-2 / Fig. 12).
- Bayer on the wire depends on flip / `0x0174` vs Pin 1 orientation.

"""


def cell_md(c) -> str:
    s = "" if c is None else str(c)
    s = s.replace("\r", "").replace("\n", "<br>").replace("|", "\\|")
    return s.strip()


def is_figure_table(rows: list) -> bool:
    if not rows:
        return True
    tokens = []
    for r in rows[:3]:
        for c in r:
            t = (c or "").strip()
            if t:
                tokens.append(t.split("\n")[0].strip())
    if not tokens:
        return True
    if tokens[0] in FIGURE_CELL:
        return True
    blob_head = " ".join((c or "") for r in rows[:2] for c in r)
    full = " ".join((c or "") for r in rows for c in r)
    if re.search(r"Short Packet|Long Packet|Packet Header|MIPI Block|Equivalent circuit", blob_head, re.I):
        return True
    if len(re.findall(r"0x[0-9A-Fa-f]{4}", full)) >= 3:
        return False
    if re.search(r"RAW10|CSI_LANE|Register Name|Pin No", full):
        return False
    nonempty = sum(1 for r in rows for c in r if c and str(c).strip())
    total = max(1, len(rows) * max(len(r) for r in rows))
    if nonempty / total < 0.28:
        return True
    header = rows[0]
    empty_h = sum(1 for c in header if not (c and str(c).strip()))
    if empty_h >= max(2, len(header) // 2) and len(re.findall(r"0x[0-9A-Fa-f]{2,}", full)) < 2:
        return True
    return nonempty / total < 0.40


def collapse_empty_cols(norm: list[list]) -> list[list] | None:
    cols = len(norm[0])
    keep = []
    for j in range(cols):
        filled = sum(1 for r in norm if cell_md(r[j]) not in ("", " "))
        if filled >= max(1, int(len(norm) * 0.12)):
            keep.append(j)
    if len(keep) < 2:
        return None
    return [[r[j] for j in keep] for r in norm]


def table_to_md(tab) -> str | None:
    try:
        rows = tab.extract()
    except Exception:
        return None
    if not rows or len(rows) < 2 or len(rows[0]) < 2:
        return None
    if is_figure_table(rows):
        return None
    cols = max(len(r) for r in rows)
    norm = [list(r) + [""] * (cols - len(r)) for r in rows]
    norm = collapse_empty_cols(norm)
    if not norm:
        return None
    header = [cell_md(c) or " " for c in norm[0]]
    body_rows = norm[1:]
    if all(h == " " for h in header):
        if len(norm) < 3:
            return None
        header = [cell_md(c) or f"c{i+1}" for i, c in enumerate(norm[1])]
        body_rows = norm[2:]
    lines = ["| " + " | ".join(header) + " |"]
    lines.append("| " + " | ".join("---" for _ in header) + " |")
    for r in body_rows:
        lines.append("| " + " | ".join(cell_md(c) for c in r) + " |")
    return "\n".join(lines)


def heading_level(size: float, bold: bool, text: str) -> int | None:
    if size >= 20:
        return 1
    if len(text.strip()) <= 2:
        return None
    if bold and size >= 10.4:
        return 2
    if bold and size >= 9.9:
        return 3
    if bold and size >= 9.4:
        return 4
    if bold and SECTION.match(text) and size >= 8.8:
        return 5
    if bold and text in {"Description", "Features", "Device Structure"}:
        return 2
    return None


def skip_running(text: str, size: float, y: float, page_h: float, page_no: int) -> bool:
    t = text.strip()
    if size >= 16:
        return False
    if SKIP_FOOTER.match(t) and (y < 40 or y > page_h - 40):
        return True
    if t == str(page_no) and y > page_h - 50:
        return True
    if t == "IMX219PQH5-C" and size < 14 and y < 50:
        return True
    return False


def inside_bbox(x: float, y: float, bb, pad: float = 3.0) -> bool:
    return (bb[0] - pad) <= x <= (bb[2] + pad) and (bb[1] - pad) <= y <= (bb[3] + pad)


def page_lines(page, page_no: int, skip_bboxes: list) -> list[tuple[float, bool, str, float]]:
    """Return (size, bold, text, y0) in reading order."""
    out = []
    page_h = page.rect.height
    for b in page.get_text("dict")["blocks"]:
        if b.get("type") != 0:
            continue
        for line in b["lines"]:
            spans = line["spans"]
            if not spans:
                continue
            text = "".join(s["text"] for s in spans).strip()
            text = re.sub(r"\s*\.{2,}\s*\d+\s*$", "", text).strip()
            if not text:
                continue
            size = max(s["size"] for s in spans)
            bold = any(bool(s["flags"] & 16) for s in spans)
            x0, y0 = line["bbox"][0], line["bbox"][1]
            if skip_running(text, size, y0, page_h, page_no):
                continue
            if any(inside_bbox(x0 + 2, y0 + 2, bb) for bb in skip_bboxes):
                continue
            out.append((size, bold, text, y0))
    return out


def is_figure_soup(raw: str) -> bool:
    if FIG_CAP.match(raw) or TBL_CAP.match(raw) or SECTION.match(raw):
        return False
    if len(raw) <= 2:
        return True
    words = raw.split()
    if len(words) >= 8:
        short = sum(1 for w in words if len(re.sub(r"[^\w]", "", w)) <= 2)
        if short / len(words) > 0.42:
            return True
    return False


def format_page_text(page, page_no: int) -> str:
    skip_bboxes = []
    tabs_md: list[tuple[float, str]] = []
    try:
        found = page.find_tables()
        for tab in found.tables:
            try:
                rows = tab.extract()
            except Exception:
                rows = []
            md = table_to_md(tab)
            if md:
                skip_bboxes.append(tab.bbox)
                tabs_md.append((tab.bbox[1], md))
            elif is_figure_table(rows):
                skip_bboxes.append(tab.bbox)
    except Exception:
        pass

    chunks: list[str] = []
    para: list[str] = []

    def flush_para():
        if not para:
            return
        raw = " ".join(para).strip()
        para.clear()
        if not raw or is_figure_soup(raw):
            return
        if BULLET.match(raw) or raw.startswith("◆"):
            item = "- " + BULLET.sub("", raw).lstrip("◆ ").strip()
            chunks.append(item)
        elif raw.startswith(":") and chunks and chunks[-1].startswith("- "):
            chunks[-1] = chunks[-1] + " " + raw.lstrip(": ").strip()
        elif FIG_CAP.match(raw):
            chunks.append(f"*{raw.strip()}*")
        elif TBL_CAP.match(raw):
            chunks.append(f"**{raw.strip()}**")
        else:
            chunks.append(raw)

    for size, bold, text, _y in page_lines(page, page_no, skip_bboxes):
        lvl = heading_level(size, bold, text)
        if lvl:
            flush_para()
            chunks.append(f"{'#' * min(lvl + 1, 6)} {text}")
            continue
        if text.startswith(":") and not para and chunks and chunks[-1].startswith("- "):
            chunks[-1] = chunks[-1] + " " + text.lstrip(": ").strip()
            continue
        if FIG_CAP.match(text) or TBL_CAP.match(text) or BULLET.match(text) or text.startswith("◆"):
            flush_para()
            para.append(text)
            flush_para()
            continue
        para.append(text)
    flush_para()

    body = "\n\n".join(c.strip() for c in chunks if c.strip())
    if tabs_md:
        tabs_md.sort(key=lambda t: t[0])
        body = (body + "\n\n" if body else "") + "\n\n".join(md for _y, md in tabs_md)
    return body.strip()


def toc_md(toc) -> str:
    lines = ["## Contents", ""]
    if not toc:
        return ""
    for lvl, title, page in toc:
        indent = "  " * max(0, lvl - 1)
        t = re.sub(r"\s+", " ", title).strip()
        lines.append(f"{indent}- [p.{page} {t}](#page-{page})")
    lines.append("")
    return "\n".join(lines)


def main() -> None:
    doc = pymupdf.open(src)
    toc = doc.get_toc(simple=True)
    pages_titles: dict[int, list[str]] = {}
    for lvl, title, page in toc:
        if lvl <= 2:
            t = re.sub(r"\s+", " ", title).strip()
            pages_titles.setdefault(page, []).append(t)

    parts = [QUICK_INDEX, toc_md(toc), "---", ""]
    for i, page in enumerate(doc, start=1):
        png = f"imx219_ds_p{i:03d}.png"
        titles = pages_titles.get(i, [])
        title_bit = " — " + "; ".join(titles[:3]) if titles else ""
        parts.append(f'<a id="page-{i}"></a>')
        parts.append("")
        parts.append(f"## Page {i}{title_bit}")
        parts.append("")
        parts.append(f'<img src="{png}" alt="IMX219 datasheet page {i}" width="900" />')
        parts.append("")
        parts.append(f"*[Original page {i}]({png})*")
        parts.append("")
        body = format_page_text(page, i)
        # Original ToC / LoF / LoT pages are the PNG; bookmark Contents is above.
        if 4 <= i <= 9:
            body = ""
        if body:
            parts.append(body)
            parts.append("")
        parts.append("---")
        parts.append("")

    out.write_text("\n".join(parts), encoding="utf-8")
    print(f"wrote {out} ({out.stat().st_size} bytes, {len(doc)} pages)")


if __name__ == "__main__":
    main()
