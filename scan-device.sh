#!/bin/bash

set -euo pipefail

LOCK="/tmp/pi-agent-deep-scan.lock"

exec 9>"$LOCK"
if ! flock -n 9; then
  echo "Another scan is already running. Try again in a minute."
  exit 0
fi

BASE_DIR="/home/raspberryjazz/pi-agent"
DATA_DIR="$BASE_DIR/data"
CURRENT="$DATA_DIR/current-devices.txt"

TARGET="${1:-}"

if [ -z "$TARGET" ]; then
  echo "Usage: /scan MAC-or-IP"
  exit 1
fi

target_lc="$(echo "$TARGET" | tr 'A-Z' 'a-z')"

# Refresh current devices first
sudo -n /usr/sbin/arp-scan --localnet --ouifile=/usr/share/arp-scan/ieee-oui.txt --macfile=/etc/arp-scan/mac-vendor.txt \
  | awk '$1 ~ /^192\.168\.0\.[0-9]+$/ && $2 ~ /^([0-9a-fA-F]{2}:){5}[0-9a-fA-F]{2}$/ {print tolower($2), $1, substr($0,index($0,$3))}' \
  | sort -u > "$CURRENT"

if echo "$target_lc" | grep -Eq '^([0-9a-f]{2}:){5}[0-9a-f]{2}$'; then
  line="$(grep -i "^$target_lc " "$CURRENT" | head -1 || true)"
  if [ -z "$line" ]; then
    echo "MAC not found in current scan: $target_lc"
    exit 0
  fi
  mac="$(echo "$line" | awk '{print $1}')"
  ip="$(echo "$line" | awk '{print $2}')"
else
  ip="$target_lc"
  line="$(awk -v ip="$ip" '$2 == ip {print; exit}' "$CURRENT" || true)"
  mac="$(echo "$line" | awk '{print $1}')"
  [ -n "$mac" ] || mac="unknown"
fi

timeout 75 "$BASE_DIR/identify-one.sh" "$ip" "$mac"
