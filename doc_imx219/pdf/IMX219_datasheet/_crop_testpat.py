"""Crop unlabeled test-pattern illustrations from pages 64–66."""
from pathlib import Path
import pymupdf

here = Path(__file__).resolve().parent
src = here.parent / "IMX219_datasheet_Quectel.pdf"
out = here / "figures"
doc = pymupdf.open(src)

# (page, filename, unique title substring)
ITEMS = [
    (64, "tp_colorbar_100.png", "100 % color bar"),
    (64, "tp_colorbar_fade.png", "fade to gray color bar"),
    (65, "tp_split16.png", "16 split Color Bar Chart"),
    (65, "tp_split16_inv.png", "Inversed 16 split"),
    (66, "tp_column_counter.png", "column counter"),
    (66, "tp_column_counter_inv.png", "inverted column counter"),
]


def line_texts(page):
    rows = []
    for b in page.get_text("dict")["blocks"]:
        if b.get("type") != 0:
            continue
        for line in b["lines"]:
            t = "".join(s["text"] for s in line["spans"]).strip()
            if t:
                rows.append((pymupdf.Rect(line["bbox"]), t))
    return rows


def clip_for_title(page, title: str) -> pymupdf.Rect:
    rows = line_texts(page)
    hits = [(r, t) for r, t in rows if title.lower() in t.lower()]
    if not hits:
        raise SystemExit(f"title not found on p{page.number+1}: {title}")
    # Prefer the uppermost matching title (not a wrap of another chart).
    cap = min(hits, key=lambda x: x[0].y0)[0]
    next_y = page.rect.y1 - 55
    for r, t in rows:
        if r.y0 <= cap.y0 + 8:
            continue
        low = t.lower()
        if "test_pattern_mode" in low or "embedded data" in low:
            continue
        if "imx219" in low or t.isdigit():
            continue
        if any(k in low for k in ("color bar", "color bar chart", "column counter", "inversed")):
            next_y = min(next_y, r.y0 - 4)
    band = pymupdf.Rect(50, cap.y0 - 2, page.rect.x1 - 50, next_y)
    ink = [cap]
    for d in page.get_drawings():
        r = pymupdf.Rect(d["rect"])
        if r.intersects(band) and r.get_area() > 400:
            ink.append(r)
    for im in page.get_image_info():
        r = pymupdf.Rect(im["bbox"])
        if r.intersects(band):
            ink.append(r)
    u = ink[0]
    for r in ink[1:]:
        u |= r
    y1 = min(u.y1 + 4, next_y)
    return pymupdf.Rect(u.x0 - 6, cap.y0 - 2, u.x1 + 6, y1) & page.rect


for pno, name, title in ITEMS:
    page = doc[pno - 1]
    clip = clip_for_title(page, title)
    pix = page.get_pixmap(clip=clip, dpi=200, alpha=False)
    dest = out / name
    pix.save(dest)
    print(f"{name} {pix.width}x{pix.height} y={clip.y0:.0f}-{clip.y1:.0f}")
