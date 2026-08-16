#!/bin/bash

set -u

TARGET="${1:-}"

BASE_DIR="/home/raspberryjazz/pi-agent"
DATA_DIR="$BASE_DIR/data"
CURRENT="$DATA_DIR/current-devices.txt"
TRUSTED="$DATA_DIR/trusted-devices.txt"

if [ -z "$TARGET" ]; then
  echo "Usage: identify-one.sh IP-or-MAC"
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

echo "Device investigation"
echo "IP:  $IP"
echo "MAC: ${MAC:-unknown}"
echo "Name: ${LABEL:-unknown/untrusted}"
echo

echo "=== ARP / neighbour info ==="
ip neigh show "$IP" 2>/dev/null || true
echo

echo "=== Current device-table entry ==="
awk -v ip="$IP" '$2==ip {print}' "$CURRENT" 2>/dev/null || echo "No current-devices entry"
echo

echo "=== Pi-hole DNS clues ==="
if command -v pihole >/dev/null 2>&1; then
  echo "Recent Pi-hole log lines for $IP:"
  sudo grep -h "$IP" /var/log/pihole/pihole.log* 2>/dev/null | tail -20 || echo "No Pi-hole log lines found"
else
  echo "Pi-hole command not found"
fi
echo

echo "=== Suricata clues ==="
if [ -f /var/log/suricata/eve.json ]; then
  echo "Recent Suricata alerts involving $IP:"
  sudo jq -r --arg ip "$IP" '
    select((.src_ip==$ip or .dest_ip==$ip) and .event_type=="alert")
    | [.timestamp, .src_ip, .src_port, "->", .dest_ip, .dest_port, .alert.signature] | @tsv
  ' /var/log/suricata/eve.json 2>/dev/null | tail -15

  echo
  echo "Recent Suricata flows/DNS/TLS/HTTP involving $IP:"
  sudo jq -r --arg ip "$IP" '
    select(.src_ip==$ip or .dest_ip==$ip)
    | [.timestamp, .event_type, .src_ip, .src_port, "->", .dest_ip, .dest_port,
       (.dns.rrname // .tls.sni // .http.hostname // .app_proto // "-")] | @tsv
  ' /var/log/suricata/eve.json 2>/dev/null | tail -20
else
  echo "No /var/log/suricata/eve.json found"
fi
echo

echo "=== mDNS / Bonjour clues ==="
timeout 10 avahi-browse -art 2>/dev/null | grep -i "$IP" -B3 -A3 || echo "No mDNS result"
echo

echo "=== UPnP / SSDP clues ==="
timeout 10 gssdp-discover -i wlan0 --timeout=5 2>/dev/null | grep -i "$IP" -B4 -A4 || echo "No SSDP result"
echo

echo "=== NetBIOS / Windows name clues ==="
timeout 10 nbtscan "$IP" 2>/dev/null || echo "No NetBIOS result"
echo

echo "=== Reverse DNS ==="
getent hosts "$IP" || echo "No reverse DNS result"
echo

echo "=== Quick TCP scan ==="
timeout 45 sudo -n nmap -Pn -sS --top-ports 200 --open "$IP" 2>/dev/null || echo "TCP scan failed or timed out"
echo

echo "=== Service/version scan on common ports ==="
timeout 60 sudo -n nmap -Pn -sV --version-light \
  -p 21,22,23,25,53,80,110,139,143,443,445,500,515,548,631,1900,2869,3306,3389,5000,5353,5555,8008,8009,8080,8443,8888,9100 "$IP" \
  2>/dev/null || echo "Service scan failed or timed out"
echo

echo "=== UDP discovery scan ==="
timeout 45 sudo -n nmap -Pn -sU --top-ports 20 "$IP" 2>/dev/null || echo "UDP scan failed or timed out"
echo

echo "=== Notes ==="
echo "- Closed ports are usually good."
echo "- 5555 open would be important because it can indicate Android Debug Bridge."
echo "- Private/random MAC addresses are common for phones, tablets, and laptops."
echo "- Pi-hole clues only appear if the device uses Pi-hole DNS."
echo "- Suricata clues only appear for traffic the Pi can actually observe."
