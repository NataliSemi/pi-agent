#!/bin/bash

set -u

BASE_DIR="/home/raspberryjazz/pi-agent"
DATA_DIR="$BASE_DIR/data"
TRUSTED="$DATA_DIR/trusted-devices.txt"
OFFSET_FILE="$DATA_DIR/telegram-offset.txt"
ENV_FILE="/etc/pi-agent/telegram.env"

mkdir -p "$DATA_DIR"

source "$ENV_FILE"

send_telegram() {
  local message="$1"
  curl -s \
    --data-urlencode "chat_id=${CHAT_ID}" \
    --data-urlencode "text=${message}" \
    "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" >/dev/null
}

scan_devices_file() {
  sudo -n /usr/sbin/arp-scan \
    --localnet \
    --ouifile=/usr/share/arp-scan/ieee-oui.txt \
    --macfile=/etc/arp-scan/mac-vendor.txt \
    2>/dev/null \
    | awk '$1 ~ /^192\.168\.0\.[0-9]+$/ && $2 ~ /^([0-9a-fA-F]{2}:){5}[0-9a-fA-F]{2}$/ {print tolower($2), $1, substr($0,index($0,$3))}' \
    | sort -u > "$DATA_DIR/current-devices.txt"
}

OFFSET="$(cat "$OFFSET_FILE" 2>/dev/null || echo 0)"
RESPONSE="$(curl -s "https://api.telegram.org/bot${BOT_TOKEN}/getUpdates?offset=${OFFSET}")"

echo "$RESPONSE" | jq -c '.result[]?' | while read -r update; do
  update_id="$(echo "$update" | jq -r '.update_id')"
  chat_id="$(echo "$update" | jq -r '.message.chat.id // empty')"
  text="$(echo "$update" | jq -r '.message.text // empty')"

  [ "$chat_id" = "$CHAT_ID" ] || {
    echo "$((update_id + 1))" > "$OFFSET_FILE"
    continue
  }

  [ -n "$text" ] || {
    echo "$((update_id + 1))" > "$OFFSET_FILE"
    continue
  }

  if echo "$text" | grep -qi '^/trust '; then
    mac="$(echo "$text" | awk '{print tolower($2)}')"
    label="$(echo "$text" | cut -d' ' -f3- | sed 's/[^a-zA-Z0-9 _().:-]//g')"

    if ! echo "$mac" | grep -Eq '^([0-9a-f]{2}:){5}[0-9a-f]{2}$'; then
      send_telegram "❌ Invalid MAC address: $mac"
      echo "$((update_id + 1))" > "$OFFSET_FILE"
      continue
    fi

    [ -n "$label" ] || label="Trusted device"

    if grep -qi "^$mac " "$TRUSTED"; then
      send_telegram "Already trusted: $mac"
    else
      echo "$mac $label" >> "$TRUSTED"
      send_telegram "✅ Added trusted device: $mac $label"
    fi

    echo "$((update_id + 1))" > "$OFFSET_FILE"
    continue
  fi

  if echo "$text" | grep -qi '^/scanfull '; then
    target="$(echo "$text" | awk '{print $2}')"
    REPORT="$("$BASE_DIR/scan-device.sh" "$target" 2>&1 | head -c 3500)"
    send_telegram "🔎 Full scan report, first part:

$REPORT"
    echo "$((update_id + 1))" > "$OFFSET_FILE"
    continue
  fi

  if echo "$text" | grep -qi '^/scan '; then
    target="$(echo "$text" | awk '{print $2}')"
    REPORT="$("$BASE_DIR/scan-summary.sh" "$target" 2>&1 | head -c 3500)"
    send_telegram "$REPORT"
    echo "$((update_id + 1))" > "$OFFSET_FILE"
    continue
  fi

  if echo "$text" | grep -qi '^/dns '; then
    target="$(echo "$text" | awk '{print $2}')"
    REPORT="$("$BASE_DIR/dns-device.sh" "$target" 2>&1 | head -c 3500)"
    send_telegram "$REPORT"
    echo "$((update_id + 1))" > "$OFFSET_FILE"
    continue
  fi

  if echo "$text" | grep -qi '^/alerts$'; then
    REPORT="$("$BASE_DIR/suricata-alerts.sh" 2>&1 | head -c 3500)"
    send_telegram "$REPORT"
    echo "$((update_id + 1))" > "$OFFSET_FILE"
    continue
  fi

  if echo "$text" | grep -qi '^/alerts '; then
    target="$(echo "$text" | awk '{print $2}')"
    REPORT="$("$BASE_DIR/suricata-alerts.sh" "$target" 2>&1 | head -c 3500)"
    send_telegram "$REPORT"
    echo "$((update_id + 1))" > "$OFFSET_FILE"
    continue
  fi

  if echo "$text" | grep -qi '^/flows '; then
    target="$(echo "$text" | awk '{print $2}')"
    REPORT="$("$BASE_DIR/suricata-flows.sh" "$target" 2>&1 | head -c 3500)"
    send_telegram "$REPORT"
    echo "$((update_id + 1))" > "$OFFSET_FILE"
    continue
  fi

  if echo "$text" | grep -qi '^/scan '; then
    target="$(echo "$text" | awk '{print $2}')"
    REPORT="$("$BASE_DIR/scan-device.sh" "$target" 2>&1 | head -c 3500)"
    send_telegram "🔎 Scan report:

$REPORT"
    echo "$((update_id + 1))" > "$OFFSET_FILE"
    continue
  fi

  if echo "$text" | grep -qi '^/health$'; then
    REPORT="$("$BASE_DIR/health-check.sh" 2>&1 | head -c 3500)"
    send_telegram "$REPORT"
    echo "$((update_id + 1))" > "$OFFSET_FILE"
    continue
  fi

  if echo "$text" | grep -qi '^/devices$'; then
    if "$BASE_DIR/scan-current-devices.sh" >/tmp/pi-agent-devices-scan.out 2>&1; then
      REPORT="$("$BASE_DIR/show-devices.sh" 2>&1 | head -c 3500)"
      send_telegram "$REPORT"
    else
      ERROR="$(cat /tmp/pi-agent-devices-scan.out | head -c 2500)"
      send_telegram "⚠️ /devices scan failed or returned no valid rows. I kept the previous device list.

$ERROR"
    fi

    echo "$((update_id + 1))" > "$OFFSET_FILE"
    continue
  fi

  if echo "$text" | grep -qi '^/help$'; then
    send_telegram "Available commands:
/health - Pi health check
/devices - Current network devices
/scan MAC-or-IP - Short device summary
/scanfull MAC-or-IP - Full scan report
/dns MAC-or-IP - Pi-hole DNS clues
/alerts - Recent Suricata alerts
/alerts MAC-or-IP - Suricata alerts for one device
/flows MAC-or-IP - Suricata traffic clues
/trust MAC Friendly name - Trust a new device"
    echo "$((update_id + 1))" > "$OFFSET_FILE"
    continue
  fi

  echo "$((update_id + 1))" > "$OFFSET_FILE"
done
