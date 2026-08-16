#!/bin/bash

set -u

DATA_DIR="/home/raspberryjazz/pi-agent/data"
CURRENT="$DATA_DIR/current-devices.txt"
TRUSTED="$DATA_DIR/trusted-devices.txt"
SEEN="/tmp/pi-agent-show-devices-seen.txt"

> "$SEEN"

echo "📡 Current home network devices"
echo

if [ ! -s "$CURRENT" ]; then
  echo "No devices found in current scan file."
  exit 0
fi

while read -r mac ip rest; do
  [ -z "${mac:-}" ] && continue

  mac_lc="$(echo "$mac" | tr 'A-F' 'a-f')"

  if grep -qi "^$mac_lc$" "$SEEN"; then
    continue
  fi

  echo "$mac_lc" >> "$SEEN"

  label="$(awk -v m="$mac_lc" 'tolower($1)==m { $1=""; sub(/^ /,""); print; exit }' "$TRUSTED" 2>/dev/null)"

  if [ -n "$label" ]; then
    echo "✅ $label"
  else
    echo "⚠️ Unknown device"
  fi

  echo "   IP: $ip"
  echo "   MAC: $mac_lc"
  echo "   Vendor: $rest"
  echo
done < "$CURRENT"
