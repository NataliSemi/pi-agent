#!/bin/bash

set -u

BASE_DIR="/home/raspberryjazz/pi-agent"
DATA_DIR="$BASE_DIR/data"
OUT="$DATA_DIR/current-devices.txt"
TMP="$DATA_DIR/current-devices.tmp"
RAW="$DATA_DIR/last-arp-scan.raw"

mkdir -p "$DATA_DIR"

sudo -n /usr/sbin/arp-scan \
  --interface=wlan0 \
  --localnet \
  --retry=3 \
  --timeout=500 \
  --ouifile=/usr/share/arp-scan/ieee-oui.txt \
  --macfile=/etc/arp-scan/mac-vendor.txt \
  > "$RAW" 2>&1

awk '$1 ~ /^192\.168\.0\.[0-9]+$/ && $2 ~ /^([0-9a-fA-F]{2}:){5}[0-9a-fA-F]{2}$/ {print tolower($2), $1, substr($0,index($0,$3))}' "$RAW" \
  | sort -u > "$TMP"

if [ ! -s "$TMP" ]; then
  echo "Scan found no valid device rows. Keeping previous device list."
  echo
  echo "Raw arp-scan output:"
  cat "$RAW"
  exit 1
fi

mv "$TMP" "$OUT"
cat "$OUT"
