# Releases

Prebuilt `.deb` packages, ready to install — no need to clone the repo or
run `build.sh`. Each package registers a GNOME thumbnailer spec
thumbnailer (works in Nautilus, Caja, Nemo, and any other file manager
that follows the spec) that extracts the preview image the slicer already
embedded in the file.

| Package | Version | File | SHA256 |
|---|---|---|---|
| [gcode-thumb](../gcode-thumb/) | 1.0.0 | [gcode-thumb_1.0.0_all.deb](gcode-thumb_1.0.0_all.deb) | `6791a8afb8d8efdbdfa2a315930e454b0c869049552b85f4af8482f5b81f3788` |
| [3mf-thumb](../3mf-thumb/) | 1.0.0 | [3mf-thumb_1.0.0_all.deb](3mf-thumb_1.0.0_all.deb) | `76af086adcd237265ced6e83b1ef1db95ea9fc0e8b1cccaf5c35c7fefa30ff2e` |

## Install

```
wget https://github.com/Mbytes/gcode-3mf-thumbnailers/raw/master/releases/gcode-thumb_1.0.0_all.deb
wget https://github.com/Mbytes/gcode-3mf-thumbnailers/raw/master/releases/3mf-thumb_1.0.0_all.deb

sudo dpkg -i gcode-thumb_1.0.0_all.deb 3mf-thumb_1.0.0_all.deb
sudo apt-get install -f   # pulls in python3 if it's missing
```

Or, if you already cloned the repo:

```
sudo dpkg -i releases/gcode-thumb_1.0.0_all.deb releases/3mf-thumb_1.0.0_all.deb
sudo apt-get install -f
```

### Verify the checksum (optional)

```
sha256sum -c <<< "6791a8afb8d8efdbdfa2a315930e454b0c869049552b85f4af8482f5b81f3788  gcode-thumb_1.0.0_all.deb"
sha256sum -c <<< "76af086adcd237265ced6e83b1ef1db95ea9fc0e8b1cccaf5c35c7fefa30ff2e  3mf-thumb_1.0.0_all.deb"
```

## After installing

File managers cache thumbnails, so refresh the cache to see previews on
files you already had open:

```
rm -rf ~/.cache/thumbnails/*
nautilus -q   # or: caja -q / nemo -q, depending on your file manager
```

## Uninstall

```
sudo dpkg -r gcode-thumb 3mf-thumb
```

## Building these yourself

These files are produced by [`build-all.sh`](../build-all.sh) from the
source in [`gcode-thumb/`](../gcode-thumb/) and
[`3mf-thumb/`](../3mf-thumb/) — see the [main README](../README.md) for
build instructions.
