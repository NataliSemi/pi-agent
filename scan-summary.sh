#!/bin/bash

set -u

TARGET="${1:-}"
BASE_DIR="/home/raspberryjazz/pi-agent"
DATA_DIR="$BASE_DIR/data"
CURRENT="$DATA_DIR/current-devices.txt"
TRUSTED="$DATA_DIR/trusted-devices.txt"

if [ -z "$TARGET" ]; then
  echo "Usage: scan-summary.sh IP-or-MAC"
  exit 1
fi

IP="$TARGET"
MAC=""

if echo "$TARGET" | grep -qiE '^([0-9a-f]{2}:){5}[0-9a-f]{2}$'; then
  MAC="$(echo "$TARGET" | tr 'A-F' 'a-f')"
  IP="$(awk -v m="$MAC" 'tolower($1)==m {print $2; exit}' "$CURRENT" 2>/dev/null)"
fi

if [ -z "${IP:-}" ]; then
  echo "Could not resolve target to IP: $TARGET"
  exit 1
fi

if [ -z "$MAC" ]; then
  MAC="$(awk -v ip="$IP" '$2==ip {print tolower($1); exit}' "$CURRENT" 2>/dev/null || true)"
fi

LABEL=""
if [ -n "$MAC" ]; then
  LABEL="$(awk -v m="$MAC" 'tolower($1)==m { $1=""; sub(/^ /,""); print; exit }' "$TRUSTED" 2>/dev/null || true)"
fi

VENDOR="$(awk -v ip="$IP" '$2==ip { $1=""; $2=""; sub(/^  /,""); print; exit }' "$CURRENT" 2>/dev/null || true)"

echo "🔎 Device summary"
echo
echo "Name: ${LABEL:-unknown/untrusted}"
echo "IP:   $IP"
echo "MAC:  ${MAC:-unknown}"
echo "Info: ${VENDOR:-unknown}"
echo

echo "Discovery:"
MDNS="$(timeout 8 avahi-browse -art 2>/dev/null | grep -i "$IP" -B3 -A4 | grep -E '(_.*\._tcp|hostname =|address =|port =|fn=|md=)' | head -12 || true)"
if [ -n "$MDNS" ]; then
  echo "$MDNS"
else
  echo "No mDNS/Bonjour clue"
fi
echo

echo "Open TCP ports:"
OPEN="$(timeout 35 sudo -n nmap -Pn --top-ports 200 --open "$IP" 2>/dev/null | awk '/^[0-9]+\/tcp/ {print}')"
if [ -n "$OPEN" ]; then
  echo "$OPEN"
else
  echo "No open TCP ports found in top 200"
fi
echo

echo "Sensitive ports:"
SENSITIVE="$(timeout 25 sudo -n nmap -Pn -p 22,23,80,443,445,5555,8008,8009,8443,8888 "$IP" 2>/dev/null | awk '/^[0-9]+\/tcp/ {print}')"
echo "$SENSITIVE"
echo

echo "Risk notes:"
if echo "$SENSITIVE" | grep -q '^5555/tcp[[:space:]]*open'; then
  echo "⚠️ ADB 5555 is OPEN. Investigate immediately."
else
  echo "✅ ADB 5555 is not open."
fi

if echo "$SENSITIVE" | grep -Eq '^(22|23)/tcp[[:space:]]*open'; then
  echo "⚠️ Remote admin port SSH/Telnet is open."
else
  echo "✅ SSH/Telnet not open."
fi

if [ -z "$LABEL" ]; then
  echo "⚠️ Device is not in trusted list."
else
  echo "✅ Device is trusted/labeled."
fi
