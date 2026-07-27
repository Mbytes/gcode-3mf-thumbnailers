# 3mf-thumb

A GNOME/Nautilus thumbnailer that extracts the preview image embedded in
`.3mf` files (PrusaSlicer, BambuStudio, OrcaSlicer, and other 3D
Manufacturing Format producers), so file managers show a real preview
instead of a generic archive icon.

## How it works

A `.3mf` file is a ZIP (OPC) package. Its root `_rels/.rels` file
declares a relationship of type
`http://schemas.openxmlformats.org/package/2006/relationships/metadata/thumbnail`
pointing at the preview image inside the archive (commonly
`Metadata/thumbnail.png`). `3mf-thumb` reads that relationship, falls
back to a few well-known paths used by common slicers if it is missing,
and writes the referenced image out as a PNG.

## Manual use

```
3mf-thumb input.3mf output.png
```

## Notes

- Only PNG thumbnails are decoded without extra dependencies. JPEG
  thumbnails are converted to PNG if `python3-pil` (Pillow) is installed.
- This system's shared-mime-info database does not ship the `model/3mf`
  type yet, so this package registers it itself.
- If a file has no embedded thumbnail, no preview is generated and the
  file manager falls back to the generic icon.
