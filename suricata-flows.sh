#!/bin/bash

set -u

TARGET="${1:-}"
DATA_DIR="/home/raspberryjazz/pi-agent/data"
CURRENT="$DATA_DIR/current-devices.txt"
EVE="/var/log/suricata/eve.json"

if [ -z "$TARGET" ]; then
  echo "Usage: suricata-flows.sh IP-or-MAC"
  exit 1
fi

if [ ! -f "$EVE" ]; then
  echo "No Suricata eve.json found at $EVE"
  exit 0
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

echo "🌊 Suricata flows/clues for $IP"
echo

sudo jq -r --arg ip "$IP" '
  select(.src_ip==$ip or .dest_ip==$ip)
  | [.timestamp, .event_type, .src_ip, .src_port, "->", .dest_ip, .dest_port,
     (.dns.rrname // .tls.sni // .http.hostname // .app_proto // "-")] | @tsv
' "$EVE" 2>/dev/null | tail -40

echo
echo "Note: Suricata only sees traffic visible to the Pi."
