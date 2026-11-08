#!/usr/bin/env python3
"""Export clock font packs (Serif, Bold, Slab, Arabic, Rounded) into JSON files for on-demand modular loading."""

import os, sys, json
HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
sys.path.insert(0, ROOT)
import build

FONTS_META = [
    (1, "rounded", "Rounded", "/system/fonts/vivoSansClockRounded.ttf", 104, 32, False),
    (2, "serif", "Serif", "/system/fonts/vivoSansClockSerif-Bold.ttf", 100, 31, False),
    (3, "bold", "Bold", "/system/fonts/vivoSansClock-Bold.ttf", 104, 32, False),
    (4, "slab", "Slab", "/system/fonts/vivoSansClockSlab.ttf", 100, 31, False),
    (5, "arabic", "Arabic", "/system/fonts/NotoNaskhArabic-Bold.ttf", 124, 38, True),
]

def pack_gmap(h, gmap):
    w_str = "".join(chr(gmap[c][0] + 35) for c in "0123456789:")
    c_list = [len(gmap[c][1]) // 8 for c in "0123456789:"]
    r_str = ""
    for c in "0123456789:":
        hex_s = gmap[c][1]
        for i in range(0, len(hex_s), 8):
            r_str += chr(int(hex_s[i:i + 2], 16) + 35)
            r_str += chr(int(hex_s[i + 2:i + 4], 16) + 35)
            r_str += chr(int(hex_s[i + 4:i + 6], 16) + 35)
            r_str += chr(int(hex_s[i + 6:i + 8], 16) + 35)
    return {"h": h, "w": w_str, "c": c_list, "r": r_str}

def export():
    out_dir = os.path.join(ROOT, "api", "fonts")
    os.makedirs(out_dir, exist_ok=True)
    manifest = []

    for idx, slug, name, path, big_px, sm_px, is_ar in FONTS_META:
        if not os.path.exists(path):
            path = "/system/fonts/Roboto-Regular.ttf"
        bh, bg = build.extract_font_size(path, big_px, is_ar)
        sh, sg = build.extract_font_size(path, sm_px, is_ar)

        font_obj = {
            "id": idx,
            "name": name,
            "slug": slug,
            "big": pack_gmap(bh, bg),
            "sm": pack_gmap(sh, sg),
        }

        # Write indexed file: cfont_2.json
        idx_path = os.path.join(out_dir, f"cfont_{idx}.json")
        with open(idx_path, "w", encoding="utf-8") as f:
            json.dump(font_obj, f, separators=(',', ':'))

        # Write slug file: serif.json
        slug_path = os.path.join(out_dir, f"{slug}.json")
        with open(slug_path, "w", encoding="utf-8") as f:
            json.dump(font_obj, f, separators=(',', ':'))

        sz = os.path.getsize(idx_path)
        manifest.append({
            "id": idx,
            "name": name,
            "slug": slug,
            "size": sz,
            "builtin": (idx == 1)
        })
        print(f"Exported Font {idx} ({name} / {slug}): {sz} bytes")

    manifest_path = os.path.join(out_dir, "manifest.json")
    with open(manifest_path, "w", encoding="utf-8") as f:
        json.dump(manifest, f, indent=2)
    print("Exported api/fonts/manifest.json")

if __name__ == "__main__":
    export()
