"""Derived app assets from the generated forest photograph and gold D artwork."""
from pathlib import Path
import numpy as np
from PIL import Image, ImageFilter

root = Path(__file__).resolve().parents[1]
workspace = root.parent
assets = root / "assets/images"
forest = Image.open(workspace / "degen-forest-v03.png").convert("RGB")
forest.save(assets / "forest.webp", quality=87)

source = Image.open(workspace / "degen-icon-v03.png").convert("RGB")
rgb = np.asarray(source).astype(float)
# Isolate the generated gold monogram, removing the bright reflected backdrop.
r, g, b = rgb[:, :, 0], rgb[:, :, 1], rgb[:, :, 2]
alpha = np.clip((r - b - 12) / 15, 0, 1) * np.clip((r - g + 2) / 10, 0, 1)
mask = Image.fromarray((alpha * 255).astype("uint8")).filter(ImageFilter.GaussianBlur(.45))
mark = source.convert("RGBA")
mark.putalpha(mask)
box = mask.getbbox()
mark = mark.crop(box)
mark.thumbnail((560, 560), Image.Resampling.LANCZOS)
size = 1024
yy, xx = np.mgrid[:size, :size]
glow = np.clip(1 - np.sqrt(((xx-480)/850)**2 + ((yy-380)/850)**2), 0, 1)
base = np.stack([7+glow*8, 28+glow*24, 21+glow*18], axis=2).astype("uint8")
icon = Image.fromarray(base).convert("RGBA")
shadow = Image.new("RGBA", (size, size))
xy = ((size-mark.width)//2, (size-mark.height)//2)
shadow.paste((0,0,0,180), (xy[0]+6,xy[1]+14,xy[0]+6+mark.width,xy[1]+14+mark.height), mark.getchannel("A"))
icon = Image.alpha_composite(icon, shadow.filter(ImageFilter.GaussianBlur(13)))
icon.alpha_composite(mark, xy)
icon.convert("RGB").save(assets / "app-icon.png")
icon.resize((256,256),Image.Resampling.LANCZOS).save(assets / "brand.png")
icon.resize((64,64),Image.Resampling.LANCZOS).save(root / "web/favicon.png")
for density, legacy, adaptive in [("mdpi",48,108),("hdpi",72,162),("xhdpi",96,216),("xxhdpi",144,324),("xxxhdpi",192,432)]:
    folder = root / f"android/app/src/main/res/mipmap-{density}"
    for name in ("ic_launcher.png","ic_launcher_round.png"):
        icon.resize((legacy,legacy),Image.Resampling.LANCZOS).save(folder/name)
    icon.resize((adaptive,adaptive),Image.Resampling.LANCZOS).save(folder/"ic_launcher_foreground.png")
assert len(icon.convert("RGB").getcolors(1024*1024) or []) > 200, "Blank icon"
print("Rendered forest, brand, and all Android icon densities; non-blank icon verified.")
