#!/bin/bash

set -u

TARGET="${1:-}"
DATA_DIR="/home/raspberryjazz/pi-agent/data"
CURRENT="$DATA_DIR/current-devices.txt"

if [ -z "$TARGET" ]; then
  echo "Usage: dns-device.sh IP-or-MAC"
  exit 1
fi

IP="$TARGET"

if echo "$TARGET" | grep -qiE '^([0-9a-f]{2}:){5}[0-9a-f]{2}$'; then
  MAC="$(echo "$TARGET" | tr 'A-F' 'a-f')"
  IP="$(awk -v m="$MAC" 'tolower($1)==m {print $2; exit}' "$CURRENT" 2>/dev/null)"
fi

if [ -z "${IP:-}" ]; then
  echo "Could not resolve target to IP: $TARGET"
  exit 1
fi

echo "🧾 Pi-hole DNS clues for $IP"
echo

if ls /var/log/pihole/pihole.log* >/dev/null 2>&1; then
  sudo zgrep -h "$IP" /var/log/pihole/pihole.log* 2>/dev/null | tail -40
else
  echo "No /var/log/pihole/pihole.log* files found."
fi

echo
echo "Note: this only works if the device uses Pi-hole as DNS."
