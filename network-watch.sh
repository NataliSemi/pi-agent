#!/bin/bash

set -euo pipefail

LOCK="/tmp/pi-agent-network-watch.lock"

exec 9>"$LOCK"
if ! flock -n 9; then
  exit 0
fi

BASE_DIR="/home/raspberryjazz/pi-agent"
DATA_DIR="$BASE_DIR/data"
TRUSTED="$DATA_DIR/trusted-devices.txt"
CURRENT="$DATA_DIR/current-devices.txt"
UNKNOWN="$DATA_DIR/unknown-devices.txt"
ALERTED="$DATA_DIR/alerted-unknown-devices.txt"
LOG="$DATA_DIR/network-watch.log"
ENV_FILE="/etc/pi-agent/telegram.env"

mkdir -p "$DATA_DIR"
touch "$ALERTED"

source "$ENV_FILE"

send_telegram() {
  local message="$1"
  curl -s \
    --data-urlencode "chat_id=${CHAT_ID}" \
    --data-urlencode "text=${message}" \
    "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" >/dev/null
}

sudo -n /usr/sbin/arp-scan --localnet --ouifile=/usr/share/arp-scan/ieee-oui.txt --macfile=/etc/arp-scan/mac-vendor.txt \
  | awk '$1 ~ /^192\.168\.0\.[0-9]+$/ && $2 ~ /^([0-9a-fA-F]{2}:){5}[0-9a-fA-F]{2}$/ {print tolower($2), $1, substr($0,index($0,$3))}' \
  | sort -u > "$CURRENT"

> "$UNKNOWN"

while read -r mac ip vendor_rest; do
  [ -z "${mac:-}" ] && continue

  if ! grep -qi "^$mac " "$TRUSTED"; then
    echo "$mac $ip $vendor_rest" >> "$UNKNOWN"
  fi
done < "$CURRENT"

if [ -s "$UNKNOWN" ]; then
  echo "$(date): UNKNOWN DEVICE(S) FOUND" >> "$LOG"
  cat "$UNKNOWN" >> "$LOG"

  while read -r mac ip vendor_rest; do
    if grep -qi "^$mac " "$ALERTED"; then
      continue
    fi

    echo "$mac $ip $vendor_rest" >> "$ALERTED"

    MESSAGE="⚠️ New unknown device on home network

IP: $ip
MAC: $mac
Vendor: $vendor_rest

No deep scan was run automatically.

Reply with:
/scan $mac

Or if you know this device:
/trust $mac Friendly device name"

    send_telegram "$MESSAGE"
  done < "$UNKNOWN"
else
  echo "$(date): OK - no unknown devices" >> "$LOG"
fi
