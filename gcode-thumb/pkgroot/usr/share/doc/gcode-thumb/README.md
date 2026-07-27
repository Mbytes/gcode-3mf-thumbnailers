# gcode-thumb

A GNOME/Nautilus thumbnailer that extracts the preview image embedded by
slicers (PrusaSlicer, SuperSlicer, OrcaSlicer, Cura + thumbnail plugin,
etc.) inside `.gcode` files, so file managers show a real preview instead
of a generic text icon.

## How it works

Slicers embed one or more preview images as base64 text in the G-code
header, e.g.:

```
; thumbnail begin 220x124 12345
; iVBORw0KGgoAAAANSUhEUgAA...
; thumbnail end
```

`gcode-thumb` scans the file header for these blocks, picks the
resolution closest to the size requested by the file manager, decodes it
and writes a PNG.

## Manual use

```
gcode-thumb -s 256 input.gcode output.png
```

## Notes

- Only PNG thumbnails are decoded without extra dependencies. JPG
  thumbnails are converted to PNG if `python3-pil` (Pillow) is installed.
- If a file has no embedded thumbnail, no preview is generated and the
  file manager falls back to the generic icon.
