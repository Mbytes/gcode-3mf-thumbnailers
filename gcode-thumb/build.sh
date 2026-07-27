#!/bin/bash
# Builds gcode-thumb_<version>_all.deb from pkgroot/.
set -euo pipefail
cd "$(dirname "$0")"

VERSION=$(awk '/^Version:/{print $2}' pkgroot/DEBIAN/control)
OUT="gcode-thumb_${VERSION}_all.deb"

find pkgroot -name '__pycache__' -type d -exec rm -rf {} + 2>/dev/null || true

chmod 755 pkgroot/usr/bin/gcode-thumb
chmod 644 pkgroot/usr/share/thumbnailers/gcode-thumb.thumbnailer
chmod 644 pkgroot/usr/share/mime/packages/gcode-thumb-mime.xml
chmod 644 pkgroot/usr/share/doc/gcode-thumb/copyright pkgroot/usr/share/doc/gcode-thumb/README.md
find pkgroot -mindepth 1 -type d -exec chmod 755 {} \;

(cd pkgroot && find usr -type f -exec md5sum {} \; > DEBIAN/md5sums)

fakeroot dpkg-deb --build --root-owner-group pkgroot "$OUT"
echo "Built $OUT"
