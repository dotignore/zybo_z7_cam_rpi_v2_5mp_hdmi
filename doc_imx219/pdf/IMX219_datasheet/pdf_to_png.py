from pathlib import Path
import fitz

here = Path(__file__).resolve().parent
src = here / "IMX219_datasheet_Quectel.pdf"
out = here

d = fitz.open(src)
for i, page in enumerate(d, start=1):
    png = out / f"imx219_ds_p{i:03d}.png"
    page.get_pixmap(dpi=200).save(png)
    print(f"saved {png.name}  ({i}/{len(d)})")
print("done")
