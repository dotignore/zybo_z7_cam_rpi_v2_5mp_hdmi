"""Compare PDF Fig./Table captions vs markdown; find drawing-heavy pages without Fig."""
from pathlib import Path
import re
import pymupdf

here = Path(__file__).resolve().parent
src = here.parent / "IMX219_datasheet_Quectel.pdf"
md = (here / "IMX219_datasheet.md").read_text(encoding="utf-8")
doc = pymupdf.open(src)

fig_re = re.compile(r"Fig\.\s*(\d+)\b")
tbl_re = re.compile(r"Table\s+(\d+)\b")

pdf_figs = {}
pdf_tbls = {}
draw_pages = []
for i, page in enumerate(doc, start=1):
    text = page.get_text("text") or ""
    for m in fig_re.finditer(text):
        n = int(m.group(1))
        pdf_figs.setdefault(n, []).append(i)
    for m in tbl_re.finditer(text):
        n = int(m.group(1))
        pdf_tbls.setdefault(n, []).append(i)
    nd = len(page.get_drawings())
    ni = len(page.get_images())
    has_fig = bool(fig_re.search(text))
    if (nd > 40 or ni > 0) and not has_fig and i not in range(4, 10):
        draw_pages.append((i, nd, ni, text.split("\n")[0][:40]))

md_figs = sorted({int(m.group(1)) for m in re.finditer(r"figures/fig_(\d+)\.png", md)})
print("PDF Fig numbers:", sorted(pdf_figs))
print("MD  Fig numbers:", md_figs)
miss_md = [n for n in sorted(pdf_figs) if n not in md_figs]
extra_md = [n for n in md_figs if n not in pdf_figs]
print("in PDF, missing in MD:", miss_md)
print("in MD, not in PDF body:", extra_md)
print("PDF Fig count unique", len(pdf_figs), "max", max(pdf_figs) if pdf_figs else None)
print("PDF Table numbers:", sorted(pdf_tbls)[:5], "...", sorted(pdf_tbls)[-3:], "count", len(pdf_tbls))
print("drawing-heavy pages without Fig. caption:")
for row in draw_pages:
    print(" ", row)

# empty page sections in md
for n in range(1, 97):
    m = re.search(rf"## Page {n}\b.*?(?=\n## Page |\Z)", md, re.S)
    if not m:
        print("NO heading page", n)
        continue
    body = m.group(0)
    # strip heading line
    lines = [ln for ln in body.splitlines()[1:] if ln.strip() and not ln.startswith("<a ")]
    if len(lines) <= 1:
        print(f"thin page {n}: {len(lines)} content lines")
