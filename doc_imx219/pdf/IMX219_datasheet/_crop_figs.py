"""Crop every Fig. N from the PDF and insert crops into IMX219_datasheet.md."""
from __future__ import annotations

import re
from pathlib import Path

import pymupdf

HERE = Path(__file__).resolve().parent
SRC = HERE.parent / "IMX219_datasheet_Quectel.pdf"
if not SRC.exists():
    SRC = HERE / "IMX219_datasheet_Quectel.pdf"
MD = HERE / "IMX219_datasheet.md"
OUT = HERE / "figures"
OUT.mkdir(exist_ok=True)

DPI = 200
CAP_RE = re.compile(r"Fig\.\s*(\d+)\b")


def caption_items(page) -> list[tuple[int, pymupdf.Rect, str]]:
    found = []
    for b in page.get_text("dict")["blocks"]:
        if b.get("type") != 0:
            continue
        for line in b["lines"]:
            t = "".join(s["text"] for s in line["spans"]).strip()
            m = CAP_RE.search(t)
            if m:
                found.append((int(m.group(1)), pymupdf.Rect(line["bbox"]), t))
    found.sort(key=lambda x: x[1].y0)
    return found


def candidate_rects(page, y_top: float, y_bot: float) -> list[pymupdf.Rect]:
    band = pymupdf.Rect(page.rect.x0, y_top, page.rect.x1, y_bot)
    out: list[pymupdf.Rect] = []
    for d in page.get_drawings():
        r = pymupdf.Rect(d["rect"])
        if r.get_area() < 8:
            continue
        if r.intersects(band) and (r.y0 + r.y1) / 2 < y_bot - 1:
            out.append(r & page.rect)
    for im in page.get_image_info():
        r = pymupdf.Rect(im["bbox"])
        if r.intersects(band):
            out.append(r & page.rect)
    return out


def cluster_near_caption(rects: list[pymupdf.Rect], cap_y: float, gap: float = 28.0):
    if not rects:
        return None
    close = [r for r in rects if cap_y - r.y1 <= 55]
    if not close:
        close = list(rects)
    u = pymupdf.Rect(close[0])
    for r in close[1:]:
        u |= r
    changed = True
    while changed:
        changed = False
        for r in rects:
            if r.y1 < u.y0 - gap or r.y0 > u.y1 + gap:
                continue
            if r.x1 < u.x0 - gap or r.x0 > u.x1 + gap:
                continue
            nu = u | r
            if abs(nu.get_area() - u.get_area()) > 1:
                u = nu
                changed = True
    return u


def expand_with_labels(page, clip: pymupdf.Rect, cap: pymupdf.Rect) -> pymupdf.Rect:
    """Include nearby labels (text) that belong to the drawing."""
    u = pymupdf.Rect(clip)
    for b in page.get_text("dict")["blocks"]:
        if b.get("type") != 0:
            continue
        r = pymupdf.Rect(b["bbox"])
        if r.intersects(cap):
            continue
        t = ""
        for line in b["lines"]:
            t += "".join(s["text"] for s in line["spans"])
        if CAP_RE.search(t) or t.strip() in {"IMX219PQH5-C"}:
            continue
        # vertically overlaps figure (with slack)
        if r.y1 < u.y0 - 8 or r.y0 > u.y1 + 8:
            continue
        # horizontally close
        if r.x1 < u.x0 - 24 or r.x0 > u.x1 + 40:
            continue
        u |= r
    return u


def pad_rect(page, r: pymupdf.Rect, pad: float = 10.0) -> pymupdf.Rect | None:
    u = pymupdf.Rect(r)
    u.x0 = max(page.rect.x0 + 28, u.x0 - pad)
    u.y0 = max(page.rect.y0 + 44, u.y0 - pad)
    u.x1 = min(page.rect.x1 - 20, u.x1 + pad + 8)
    u.y1 = min(page.rect.y1 - 28, u.y1 + pad)
    if u.width < 40 or u.height < 20:
        return None
    return u


def crop_all() -> dict[int, Path]:
    doc = pymupdf.open(SRC)
    mapping: dict[int, Path] = {}
    for i, page in enumerate(doc, start=1):
        if 4 <= i <= 9:
            continue
        caps = caption_items(page)
        for k, (num, cap, _t) in enumerate(caps):
            y_bot = cap.y0 - 2
            if k == 0:
                y_top = 55.0
            else:
                y_top = caps[k - 1][1].y1 + 4
            if y_bot <= y_top + 8:
                continue
            rects = candidate_rects(page, y_top, y_bot)
            clip = cluster_near_caption(rects, cap.y0)
            if clip is None:
                clip = pymupdf.Rect(50, y_top, page.rect.x1 - 50, y_bot)
            clip = expand_with_labels(page, clip, cap)
            clip = pad_rect(page, clip)
            if clip is None:
                print(f"skip Fig.{num} p{i} too small")
                continue
            # do not include the caption line
            if clip.y1 > cap.y0 - 1:
                clip.y1 = cap.y0 - 1
            pix = page.get_pixmap(clip=clip, dpi=DPI, alpha=False)
            dest = OUT / f"fig_{num:02d}.png"
            pix.save(dest)
            mapping[num] = dest
            print(f"Fig.{num:02d}  p{i:03d}  {pix.width}x{pix.height}  {dest.name}")
    return mapping


def update_md(mapping: dict[int, Path]) -> None:
    text = MD.read_text(encoding="utf-8")
    # drop full-page images from the article flow
    text = re.sub(
        r'<img src="imx219_ds_p\d+\.png"[^>]*>\s*',
        "",
        text,
    )
    text = re.sub(
        r'\*\[Original page \d+\]\(imx219_ds_p\d+\.png\)\*\s*',
        "",
        text,
    )

    def inject(m: re.Match) -> str:
        num = int(m.group(2))
        cap = m.group(1)
        if num not in mapping:
            return cap
        rel = f"figures/fig_{num:02d}.png"
        if rel in cap or f"fig_{num:02d}.png" in m.string[m.end() : m.end() + 80]:
            return cap
        return (
            f'{cap}\n\n'
            f'<img src="{rel}" alt="Fig. {num}" width="720" />'
        )

    text = re.sub(r"(\*Fig\.\s*(\d+)[^*]*\*)", inject, text)
    MD.write_text(text, encoding="utf-8")
    print(f"updated {MD}")


if __name__ == "__main__":
    m = crop_all()
    print(f"cropped {len(m)} figures")
    missing = [n for n in range(1, 51) if n not in m]
    if missing:
        print("missing Fig.", missing)
    update_md(m)
