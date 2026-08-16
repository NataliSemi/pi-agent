#!/bin/bash

BASE="$HOME/pi-agent/data/known-devices.txt"
CURRENT="/tmp/current-devices.txt"

sudo arp-scan --localnet \
  | awk '/192\.168\.0\./ {print $1, $2, substr($0,index($0,$3))}' \
  | sort > "$CURRENT"

echo "=== Current devices ==="
cat "$CURRENT"

echo
echo "=== Changes compared to baseline ==="
diff -u "$BASE" "$CURRENT" || true
