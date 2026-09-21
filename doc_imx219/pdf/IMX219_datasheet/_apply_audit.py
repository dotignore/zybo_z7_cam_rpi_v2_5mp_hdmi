"""Patch IMX219_datasheet.md so text/tables match the page PNGs."""
from __future__ import annotations

import re
from pathlib import Path

p = Path(__file__).resolve().parent / "IMX219_datasheet.md"
text = p.read_text(encoding="utf-8")


def replace_between(src: str, start: str, end: str, new_mid: str) -> str:
    i = src.find(start)
    j = src.find(end, i)
    if i < 0 or j < 0:
        raise SystemExit(f"block not found: {start[:60]!r} ... {end[:40]!r}")
    return src[: i + len(start)] + new_mid + src[j:]


# --- global: PDF subscript underscores leaked as "_ _" ---
text = re.sub(r"<br>_+\s*", "", text)
text = re.sub(r"(?<![A-Za-z0-9])_+(?![A-Za-z0-9])", "", text)

NAME_FIX = [
    ("CSI LANE MODE", "CSI_LANE_MODE"),
    ("CSI DATA FORMAT", "CSI_DATA_FORMAT"),
    ("CSI CH ID", "CSI_CH_ID"),
    ("CSI SIG MODE", "CSI_SIG_MODE"),
    ("CSI channel identifier", "CSI_channel_identifier"),
    ("CSI data format", "CSI_data_format"),
    ("EXCK FREQ", "EXCK_FREQ"),
    ("FRM LENGTH", "FRM_LENGTH"),
    ("LINE LENGTH", "LINE_LENGTH"),
    ("MODEL ID", "MODEL_ID"),
    ("mode select", "mode_select"),
    ("software reset", "software_reset"),
    ("BINNING MODE", "BINNING_MODE"),
    ("BINNING CAL MODE", "BINNING_CAL_MODE"),
    ("IMG ORIENTATION", "IMG_ORIENTATION"),
    ("FRAME BANK", "FRAME_BANK"),
    ("X ADD STA", "X_ADD_STA"),
    ("X ADD END", "X_ADD_END"),
    ("Y ADD STA", "Y_ADD_STA"),
    ("Y ADD END", "Y_ADD_END"),
    ("X ODD INC", "X_ODD_INC"),
    ("Y ODD INC", "Y_ODD_INC"),
    ("DT FMT", "DT_FMT"),
    ("FRM FMT", "FRM_FMT"),
    ("TEMPERATURE EN", "TEMPERATURE_EN"),
    ("TEMPERATURE VAL", "TEMPERATURE_VAL"),
    ("ANA GAIN GLOBAL", "ANA_GAIN_GLOBAL"),
    ("DIG GAIN GLOBAL", "DIG_GAIN_GLOBAL"),
    ("COARSE INTEGRATION", "COARSE_INTEGRATION"),
    ("COARSE INTEG TIME", "COARSE_INTEG_TIME"),
    ("COMP ENABLE", "COMP_ENABLE"),
    ("FRAME DURATION", "FRAME_DURATION"),
    ("SENSOR MODE", "SENSOR_MODE"),
    ("Lot ID", "Lot_ID"),
    ("Wafer Num", "Wafer_Num"),
    ("Chip Number", "Chip_Number"),
    ("FRM CNT", "FRM_CNT"),
    ("PX ORDER", "PX_ORDER"),
    ("DT PEDESTAL", "DT_PEDESTAL"),
    ("image orientation", "image_orientation"),
    ("coarse integration time", "coarse_integration_time"),
    ("fine integration time", "fine_integration_time"),
    ("Exmor RTM", "Exmor R™"),
]
for a, b in NAME_FIX:
    text = text.replace(a, b)

# --- page 1: missing RGB-filter bullet (on PNG between shutter and 30 fps) ---
old = """- Variable-speed shutter function (1 H units)

- Max. 30 frame/s in all-pixel scan mode"""
new = """- Variable-speed shutter function (1 H units)

- R, G, B primary color pigment mosaic filters on chip

- Max. 30 frame/s in all-pixel scan mode"""
if old not in text:
    raise SystemExit("page1 bullet block missing")
text = text.replace(old, new, 1)

# --- pages 10–12 pin tables (transcribed from PNGs) ---
PIN10 = r"""
**Table 1 Pin Description**

| Pin No. | Symbol | I/O | A/D | Description | Remarks |
| --- | --- | --- | --- | --- | --- |
| 1 | VDDLSC1 | Power | D | 1.2 V Power | |
| 2 | VSSLSC1 | GND | D | 1.2 V GND | |
| 3 | VDDHCM1 | Power | A | 2.8 V Power | |
| 4 | VSSHCM1 | GND | A | 2.8 V GND | |
| 5 | VSSLCN1 | GND | D | 1.2 V GND | |
| 6 | VDDLCN1 | Power | D | 1.2 V Power | |
| 7 | VSSLDM1 | | | Dummy | NC |
| 8 | VSSLSC2 | GND | D | 1.2 V GND | |
| 9 | VDDHFIL1 | Power | A | 2.8 V Power | = VANA |
| 10 | VDDLCN2 | Power | D | 1.2 V Power | |
| 11 | VSSLCN2 | GND | D | 1.2 V GND | |
| 12 | VSSHCM2 | GND | A | 2.8 V GND | |
| 13 | VDDHCM2 | Power | A | 2.8 V Power | |
| 14 | VSSLSC3 | GND | D | 1.2 V GND | |
| 15 | VDDLSC3 | Power | D | 1.2 V Power | |
| 16 | VCP | O | A | Analog Output | Connect to capacitor (2.2 µF) |
| 17 | VBO | O | A | Analog Output | Connect to capacitor (1.0 µF) |
| 18 | VSSHSN1 | GND | A | 2.8 V GND | |

"""
text = replace_between(
    text,
    "**Table 1 Pin Description**\n",
    "---\n\n<a id=\"page-11\"></a>",
    PIN10.split("**Table 1 Pin Description**\n", 1)[1],
)

PIN11 = r"""
**Table 1 Pin Description (continued)**

| Pin No. | Symbol | I/O | A/D | Description | Remarks |
| --- | --- | --- | --- | --- | --- |
| 19 | VDDHSN1 | Power | A | 2.8 V Power | |
| 20 | VSSLSC4 | GND | D | 1.2 V GND | |
| 21 | POREN | I | D | Digital Input | Connect to VDIG |
| 22 | XCLR | I | D | Digital Input | |
| 23 | TENABLE | I | D | Digital Input | NC |
| 24 | GPO | I/O | D | Digital Input/Output | Connect to VSSLSC when GPO is not enable |
| 25 | FSTROBE | O | D | Digital Output | |
| 26 | SDA | I/O | D | Digital Input/Output | |
| 27 | SCL | I | D | Digital Input | |
| 28 | TEST1 | I | D | Digital Input | NC |
| 29 | SWTCK | I | D | Digital Input | NC |
| 30 | INCK | I | D | Digital Input | |
| 31 | VDDMCO | Power | D | 1.8 V Power | |
| 32 | VSSLSC5 | GND | D | 1.2 V GND | |
| 33 | VDDLSC5 | Power | D | 1.2 V Power | |
| 34 | VDDHFIL2 | Power | A | 2.8 V Power | = VANA |
| 35 | VDDLSC6 | Power | D | 1.2 V Power | |
| 36 | VSSLSC6 | GND | D | 1.2 V GND | |
| 37 | VSSLDM2 | | | Dummy | NC |
| 38 | VDDLSC7 | Power | D | 1.2 V Power | |
| 39 | VSSLSC7 | GND | D | 1.2 V GND | |
| 40 | VDDLIO1 | Power | D | 1.2 V Power | |
| 41 | VSSLIO1 | GND | D | 1.2 V GND | |
| 42 | DMO1N | O | D | Digital Output | |
| 43 | DMO1P | O | D | Digital Output | |
| 44 | DMO2N | O | D | Digital Output | |
| 45 | DMO2P | O | D | Digital Output | |
| 46 | VSSLIO2 | GND | D | 1.2 V GND | |
| 47 | DCKN | O | D | Digital Output | |
| 48 | DCKP | O | D | Digital Output | |
| 49 | VSSLIO3 | GND | D | 1.2 V GND | |
| 50 | DMO3N | O | D | Digital Output | |
| 51 | DMO3P | O | D | Digital Output | |
| 52 | DMO4N | O | D | Digital Output | |
| 53 | DMO4P | O | D | Digital Output | |
| 54 | VSSLIO4 | GND | D | 1.2 V GND | |
| 55 | VDDLIO2 | Power | D | 1.2 V Power | |
| 56 | VSSLSC8 | GND | D | 1.2 V GND | |
| 57 | VDDLSC8 | Power | D | 1.2 V Power | |

"""
# page 11 currently has almost no body
text = replace_between(
    text,
    '*[Original page 11](imx219_ds_p011.png)*\n',
    "---\n\n<a id=\"page-12\"></a>",
    PIN11,
)

PIN12 = r"""
**Table 1 Pin Description (continued)**

| Pin No. | Symbol | I/O | A/D | Description | Remarks |
| --- | --- | --- | --- | --- | --- |
| 58 | VSSHPL | GND | D | 2.8 V GND | |
| 59 | VDDHPL | Power | D | 2.8 V Power | |
| 60 | TVCDSIN | I | A | Analog Input | NC, For test |
| 61 | TVMON | O | A | Analog Output | NC, For test |
| 62 | VSSHAN | GND | A | 2.8 V GND | |
| 63 | VDDHAN | Power | A | 2.8 V Power | |
| 64 | VDDHSN2 | Power | A | 2.8 V Power | |
| 65 | VSSHSN2 | GND | A | 2.8 V GND | |

"""
text = replace_between(
    text,
    '*[Original page 12](imx219_ds_p012.png)*\n',
    "---\n\n<a id=\"page-13\"></a>",
    PIN12,
)

# --- page 16: figure labels leaked ---
text = text.replace(
    "Maximum output data rate is 912 Mbps/lane. (1lane output is not supported). Lane 1 Lane 2 Clock Lane Lane 3 Lane 4",
    "Maximum output data rate is 912 Mbps/lane. (1lane output is not supported).",
)

# --- page 17: figure dump ---
text = text.replace(
    " that Start condition is recognized as a Repeated Start condition. Master IMX149 SCL SDA IMX219",
    " that Start condition is recognized as a Repeated Start condition.",
)

# --- page 47 ---
text = text.replace("\nline blanking frame blanking Next Frame FS\n", "\n")
P47_TBL = """
| Index | Byte | Register Name | RW | Comment | Default (HEX) | Remark |
| --- | --- | --- | --- | --- | --- | --- |
| 0x0114 | [1:0] | CSI_LANE_MODE | RW | 03: 4Lane<br>01: 2Lane | 03 | Setting before “standby cancel” |
"""
text = replace_between(
    text,
    "**Table 12 Number of CSI lane Setting Registers**\n",
    "---\n\n<a id=\"page-48\"></a>",
    """
##### 4-1-2  CSI-2 Frame Structure

The image frame structure is shown below.

*Fig. 20 Frame Structure for Serial signal output*
"""
    + P47_TBL
    + "\n",
)

# --- page 48 figure soup ---
text = text.replace(
    """*Fig. 23 Short Packet & Long Packet*

Data Lane Clock Lane Disconnect Terminator LP-11 LP-01 LP-00 Line Blanking Disconnect Terminator Data Lane Clock Lane LP-11 LP-01 LP-00 Frame Blanking
""",
    """*Fig. 23 Short Packet & Long Packet*

(Waveforms and packet diagrams are on the page image.)
""",
)

# --- page 49 tables from PNG ---
text = replace_between(
    text,
    "**Table 13 Image pixel area and data type**\n",
    "---\n\n<a id=\"page-50\"></a>",
    """
| image pixel area | Data Type |
| --- | --- |
| Embedded Data Lines | Embedded Data |
| OBside ineffective area | Null |
| OB area for internal use | Null |
| effective OB | OPB Data |
| Effective area side ineffective area | Null |
| effective pixel | RAW10 or RAW8 or COMP8 |

##### 4-1-5  CSI-2 Frame Format

The data format of each line is based on CSI-2 General Frame Format. The period from a line end sync code to the line start sync code for the next line is called the line blanking period. Likewise, the period from a frame end sync code to the next frame start sync code is called the frame blanking period. Packet header consists of the following data.

**Table 14 Sync Code Settings**

| Header [7:0] | Description | Setting register | Remarks |
| --- | --- | --- | --- |
| [7:6] | Virtual Channel Identifier | Addr: 0x0110 / CSI_channel_identifier | See Register Section |
| [5:0] | Synch Short Packet Data types | NA | |
| 6'h00 | Frame Start Code | NA | |
| 6'h01 | Frame End Code | NA | |
| 6'h12 | Embedded Data | NA | Written data in the sensor |
| 6'h2A | RAW8 | CSI_data_format | 16'h0808 |
| 6'h2B | RAW10 | CSI_data_format | 16'h0A0A |

""",
)

# --- page 50 packing soup ---
text = replace_between(
    text,
    '*[Original page 50](imx219_ds_p050.png)*\n',
    "---\n\n<a id=\"page-51\"></a>",
    """
##### 4-1-6  CSI-2 Embedded Data Line

The value of the 2-wire serial communication configuration register can be output at the start of the frame. The output register is indicated in the “Embd DL” column of the 2-wire serial communication Register Map. The Embedded data line is output in the two lines following the sync code FS.

*Fig. 24 Frame Format during Embedded Data Line Output*

The output method differs according to the data format. In RAW10 mode, dummy bytes are inserted after outputting 4 bytes of data and tags.

*Fig. 25 Embedded data lines alignment in RAW8 mode*

*Fig. 26 Detailed Embedded Data Line Output in RAW10 Output Mode*

""",
)

# --- page 52 figure labels ---
text = text.replace(
    "Readout position is explained by Readout Position session Effective OPB（16） OPB Invalid Area （8） Invalid Active area （8）",
    "Readout position is explained by Readout Position session.\n\n"
    "From Fig. 27: Effective Area 3296 (H) × 2480 (V); Active Area 3280 (H) × 2464 (V); "
    "Invalid Active area 8 px on each side; OPB Invalid Area 16 + 8; Effective OPB 16.",
)

# --- page 53 ---
text = replace_between(
    text,
    '*[Original page 53](imx219_ds_p053.png)*\n',
    "---\n\n<a id=\"page-54\"></a>",
    """
#### 5-2  Pixel Binning Mode

Binning read-out can be used to obtain an image of lower resolution for full field of view. It has advantage on frame rate than using digital scaling, and on signal-to-noise ratio than using sub-sampling. See Binning Capability Registers, for detail of available configurations.
The following diagram describes on 2x2 averaged binning operations. Pixels of two adjacent rows and columns are averaged, and read out as one output pixel.

*Fig. 28 Image of 2x2 averaged Binning Mode*

For explanation, represent individual pixels with it's addresses in the format “color (x, y) ” - for example, The Red pixel in the lower left corner is expressed as R (0, 0).
By performing 2x2 binning, R (0, 0) after binning is obtained by the following equation.

`R (0, 0) after binning = ( {R (0, 0) + R (0, 2)} /2 + {R (2,0) + R (2,2)} /2 ) / 2`

And, the total number of output pixels is reduced to 1/4 of the original pixel array.

**Table 16 Mode example**

| Mode | Full | x2binning | x4binning |
| --- | --- | --- | --- |
| Frame rate | 30 frame/s | 120 frame/s | 120 frame/s |
| H binning | — | Analog | Digital |
| H | x1 | x2 | X4 |
| V | x1 | x2 | x4 |

""",
)

# --- page 55 ---
text = replace_between(
    text,
    '*[Original page 55](imx219_ds_p055.png)*\n',
    "---\n\n<a id=\"page-56\"></a>",
    """
#### 5-4  Readout Position

The IMX219PQH5-C default status is readout from the lower left corner when Pin 1 is located in the upper right corner. The image is inverted vertically and horizontally by the lens, so proper image output results when Pin 1 is located in the upper right corner.

*Fig. 30 Readout Position* (`image_orientation=0h`)

Readout direction can be set by the registers.

**Table 17 Image Orientation Register**

| CCI register | Field | Mode |
| --- | --- | --- |
| image_orientation [0] | 0 | no mirror (Readout from the left with Pin 1 in the upper right corner) |
| image_orientation [0] | 1 | Horizontal Mirror (Readout from the right with Pin 1 in the upper right corner) |
| image_orientation [1] | 0 | no flip (Readout from the bottom with Pin 1 in the upper right corner) |
| image_orientation [1] | 1 | Vertical Flip (Readout from the top with Pin 1 in the upper right corner) |

*Fig. 31 Output Image Diagrams for Vertical Flip and Horizontal Mirror*

(`image_orientation=1h` / `2h` / `3h` on the page image)

""",
)

# --- page 56 formula + tables from PNG ---
text = replace_between(
    text,
    '*[Original page 56](imx219_ds_p056.png)*\n',
    "---\n\n<a id=\"page-57\"></a>",
    r"""
#### 5-5  Frame Rate Calculation Formula

Frame rate in all-pixel scan mode is calculated by the followings.

\[
\mathrm{Frame\_Rate[frame/s]} = \frac{1}{\mathrm{Time\_per\_Line[sec]} \times (\mathrm{Frame\_Length})}
\]

\[
\mathrm{Time\_Per\_Line\_[sec]} = \frac{\mathrm{Line\_Length\_pck[pix]}}{2 \times \mathrm{Pix\_Clock\_Freq[MHz]}}
\]

- If `(frame_length_lines - 4 > coarse_integration_time)`: `Frame_Length = frame_length_lines`
- If `(frame_length_lines - 4 < coarse_integration_time)`: `Frame_Length = coarse_integration_time + 4`

#### 5-6  Black Level Control

The IMX219PQH5-C has a stable black level clamp function. The average value of the black level is adjusted to 64d. When selecting output format RAW8, Black level in the table below is divided by 4.

**Table 18 Gain Setting Variables**

| CCI | Black Level (dec) |
| --- | --- |
| | 64 (Fixed) RAW10, COMP8 |
| | 16 (Fixed) RAW8 |

#### 5-7  Storage Time (Electronic Shutter) Settings

##### 5-7-1  Storage Time (Electronic Shutter) Setting Registers

The storage time setting registers are shown below. The value of the register, `coarse_integration_time`, indicates the number of lines for the storage time. The maximum storage time value in normal frame rate mode is obtained by subtracting “4” from the number of lines per frame (set by `frame_length_lines`) including the blanking period.

**Table 19 Storage Time Setting Register**

| CCI registers | Register name | Address | Setting value (dec) | Remarks |
| --- | --- | --- | --- | --- |
| | coarse_integration_time | 0x015A / 0x015B / 0x025A / 0x025B | 1 to frame_length_lines−4 | 0x015A = A[15:8], 0x015B = A[7:0], 0x025A = B[15:8], 0x025B = B[7:0] |

The value of the register, `fine_integration_time`, indicates the number of pixels for the storage time. The register, `fine_integration_time`, is a fixed value, read only register.

**Table 20 Storage Time Offset Register**

| CCI registers | Register name | Address | Setting value (dec) | Remarks |
| --- | --- | --- | --- | --- |
| | fine_integration_time | 0x0388 / 0x0389 | 500 | RO register |

""",
)

# --- page 81: missing Table 39; drop diagram soup ---
text = replace_between(
    text,
    '*[Original page 81](imx219_ds_p081.png)*\n',
    "---\n\n<a id=\"page-82\"></a>",
    """
### 9.  Other Functions

#### 9-1  Clock System

##### 9-1-1  Clock Structure

The IMX219PQH5-C clock system has the following structure.

*Fig. 43 Clock System Block Diagram*

The IMX219PQH5-C is comprised of 2 ch Pipe-Line, and 2 PLL for both pixel read domain and Output data domain. See following section (Clock Setting Example) for detail.

Relationships between 2 domains are the followings;

1. If Pix Rate of PLL1 domain < Data Rate of PLL2 domain, data is always correctly output from the sensor
2. If Pix Rate of PLL1 domain > Data rate of PLL2 domain, Else If de-rating (binning and sub-sampling without resize), FiFo can handle.

##### 9-1-2  EXCK_FREQ setting depend on INCK frequency

The IMX219PQH5-C has the function that automatically set Pre-Div1 and Pre-Div2 by setting the register of EXCK_FREQ, case of changing INCK frequency.

**Table 39 EXCK_FREQ setting table**

| INCK (Input Pin) | EXCK_FREQ (0x012A/0x012B) | PREPLLCK_VT_DIV (0x0304) | PREPLLCK_OP_DIV (0x0305) | Remark |
| --- | --- | --- | --- | --- |
| 6 to 12 MHz | 6d to 12d (06h to 0Ch) | 01h (auto set) | 01h (auto set) | |
| 12 to 24 MHz | 12d to 24d (0Ch to 18h) | 02h (auto set) | 02h (auto set) | |
| 24 to 27 MHz | 24d to 27d (18h to 1Bh) | 03h (auto set) | 03h (auto set) | |

""",
)

# --- page 82 clock example table from PNG ---
text = replace_between(
    text,
    '*[Original page 82](imx219_ds_p082.png)*\n',
    "---\n\n<a id=\"page-83\"></a>",
    """
#### 9-2  Clock Setting Example

| | CSI-2 | CSI-2 | CSI-2 |
| --- | --- | --- | --- |
| ADC bit width | 10 | 10 | 10 |
| Data Mode | Raw10 | Raw10 | Raw10 |
| FPS | 30 frame/s | 180 frame/s | 21 frame/s (*) |
| Lanes | 4 | 4 | 2 |
| Bin / Sub | Full-Pel | 2 (V) ×2 (H) analog (special) binning | Full-Pel |
| Output Size (H, V) | 3280 × 2464 | 1408 × 792 | 3280 × 2464 |
| pll1_vt_freq | 702 MHz | 702 MHz | 456 MHz |
| EXCK_FREQ | 12 | 12 | 12 |
| VTSYCK_DIV | 1 | 1 | 1 |
| vt_pix_clk_div | 5 | 5 | 10 |
| Pix Rate | 280.8M pix | 280.8M pix | 182.4M pix |
| Actual freq (VTCK) | 140.4 MHz | 140.4 MHz | 91.2 MHz |
| pll2_op_freq | 726 MHz | 726 MHz | 912 MHz |
| op_sys_clk_div | 1 | 1 | 1 |
| op_pix_clk_div | 10 | 10 | 10 |
| de-rating | 1 | 1 | 1 |
| Output Lanes | 4 | 4 | 2 |
| Actual freq (OPCK) | 72.6 MHz | 72.6 MHz | 91.2 MHz |
| Actual MIPI-freq (byte) | 90.75 MHz | 90.75 MHz | 114 MHz |
| Speed/Lane (Ch) | 726 Mbps | 726 Mbps | 912 Mbps |
| Total Output Rate | 2.904 Gbps | 2.904 Gbps | 1.824 Gbps |

\\* Max. frame rate is 21 frame/s

This table is **full-array** examples (not the project 1920×1080 V-crop). 2-lane column matches the 912 Mbps/lane datasheet max.

""",
)

# --- page 89 Table 47 ---
text = text.replace(
    "**Table 47 Measurement Conditions**\n\nIn the following measurements",
    """**Table 47 Measurement Conditions**

| | |
| --- | --- |
| Supply voltage | Analog 2.8 V, digital 1.2 V, IF 1.8 V |
| Clock | INCK (EXTCLK) 18 MHz |

In the following measurements""",
)

# Bayer table on p89 matches Fig. 47 (Gb/B then R/Gr). Add a caption.
text = text.replace(
    """*Fig. 47 Color coding alignment*

#### 13-3  Definition of Standard Imaging Conditions""",
    """*Fig. 47 Color coding alignment*

First line of the figure: **Gb B**; second line: **R Gr** (same as project Bayer **GBRG** when Pin 1 is upper-right / `image_orientation=0`).

#### 13-3  Definition of Standard Imaging Conditions""",
)

note = (
    "Checked against page PNGs (2026-09-11): pin tables 10–12, CSI DT (p47/p49), "
    "crop defaults (p26/p28/p30/p31), array (p52), orientation (p55), frame-rate formula (p56), "
    "EXCK/clock examples (p81–p82), Bayer (p89). "
    "Dense register-map pages still use auto-extracted grids — **hex defaults were spot-checked**; "
    "if a grid looks scrambled, trust the PNG.\n\n"
)
if "Checked against page PNGs" not in text:
    text = text.replace(
        "Each section below starts with the **original page image**, then searchable formatted text.\n",
        "Each section below starts with the **original page image**, then searchable formatted text.\n\n"
        + note,
    )

p.write_text(text, encoding="utf-8")
print(f"patched {p} ({p.stat().st_size} bytes)")
