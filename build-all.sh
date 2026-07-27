#!/bin/bash
# Builds both .deb packages.
set -euo pipefail
cd "$(dirname "$0")"

./gcode-thumb/build.sh
./3mf-thumb/build.sh
