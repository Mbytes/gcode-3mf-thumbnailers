# gcode-3mf-thumbnailers

GNOME/Nautilus-spec thumbnailers (also work in Caja, Nemo, Thunar+tumbler,
etc.) that show real preview images for 3D-printing files on Linux:

- **[gcode-thumb](gcode-thumb/)** — extracts the preview image slicers
  (PrusaSlicer, SuperSlicer, OrcaSlicer, Cura + thumbnail plugin) embed as
  base64 text inside `.gcode` file comments.
- **[3mf-thumb](3mf-thumb/)** — extracts the preview image embedded in
  `.3mf` project files (PrusaSlicer, BambuStudio, OrcaSlicer), which are
  ZIP/OPC packages with an official thumbnail relationship.

Both are small, dependency-free Python 3 scripts registered as
`/usr/share/thumbnailers/*.thumbnailer` entries — no rendering involved,
they just pull out the image the slicer already generated and saved
inside the file.

## Based on  STL-THUMB 
https://github.com/unlimitedbacon/stl-thumb

## Build

Each package builds independently:

```
./gcode-thumb/build.sh   # -> gcode-thumb/gcode-thumb_1.0.0_all.deb
./3mf-thumb/build.sh     # -> 3mf-thumb/3mf-thumb_1.0.0_all.deb
```

or build both at once:

```
./build-all.sh
```

Requires `dpkg-deb` and `fakeroot` (both in `dpkg-dev`/`fakeroot`
packages on Debian/Ubuntu/Mint).

## Install

```
sudo dpkg -i gcode-thumb/gcode-thumb_1.0.0_all.deb
sudo dpkg -i 3mf-thumb/3mf-thumb_1.0.0_all.deb
sudo apt-get install -f   # pulls in python3 if missing
```

Then refresh the file manager's thumbnail cache:

```
rm -rf ~/.cache/thumbnails/*
nautilus -q   # or: caja -q / nemo -q, depending on your file manager
```

## Layout

Each package directory contains a `pkgroot/` that mirrors the final
filesystem layout the `.deb` installs (`usr/bin/...`,
`usr/share/thumbnailers/...`, `usr/share/mime/packages/...`,
`DEBIAN/control`), plus a `build.sh` that sets permissions, computes
`DEBIAN/md5sums` and calls `dpkg-deb --build`.

## License

MIT — see [LICENSE](LICENSE).
