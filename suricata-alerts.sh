#!/bin/bash

set -u

TARGET="${1:-}"
DATA_DIR="/home/raspberryjazz/pi-agent/data"
CURRENT="$DATA_DIR/current-devices.txt"
EVE="/var/log/suricata/eve.json"

if [ ! -f "$EVE" ]; then
  echo "No Suricata eve.json found at $EVE"
  exit 0
fi

IP=""

if [ -n "$TARGET" ]; then
  IP="$TARGET"
  if echo "$TARGET" | grep -qiE '^([0-9a-f]{2}:){5}[0-9a-f]{2}$'; then
    MAC="$(echo "$TARGET" | tr 'A-F' 'a-f')"
    IP="$(awk -v m="$MAC" 'tolower($1)==m {print $2; exit}' "$CURRENT" 2>/dev/null)"
  fi
fi

if [ -n "$IP" ]; then
  echo "🚨 Suricata alerts for $IP"
  sudo jq -r --arg ip "$IP" '
    select(.event_type=="alert" and (.src_ip==$ip or .dest_ip==$ip))
    | [.timestamp, .src_ip, .src_port, "->", .dest_ip, .dest_port, .alert.signature] | @tsv
  ' "$EVE" 2>/dev/null | tail -30
else
  echo "🚨 Recent Suricata alerts"
  sudo jq -r '
    select(.event_type=="alert")
    | [.timestamp, .src_ip, .src_port, "->", .dest_ip, .dest_port, .alert.signature] | @tsv
  ' "$EVE" 2>/dev/null | tail -30
fi
