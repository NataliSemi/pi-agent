#!/bin/bash

set -u

HOST="$(hostname)"
TIME="$(date)"
DATA_DIR="/home/raspberryjazz/pi-agent/data"
LOG="$DATA_DIR/network-watch.log"

echo "🩺 Raspberry Pi health check"
echo "Host: $HOST"
echo "Time: $TIME"
echo

WARN=0

section() {
  echo
  echo "=== $1 ==="
}

section "Overall summary"

TEMP_RAW="$(vcgencmd measure_temp 2>/dev/null | sed "s/temp=//;s/'C//" || echo "")"
THROTTLED="$(vcgencmd get_throttled 2>/dev/null | cut -d= -f2 || echo "unknown")"
ROOT_USE="$(df -P / | awk 'NR==2 {gsub("%","",$5); print $5}')"
SSD_USE="$(df -P /mnt/ssd 2>/dev/null | awk 'NR==2 {gsub("%","",$5); print $5}')"
MEM_AVAIL_MB="$(free -m | awk '/Mem:/ {print $7}')"
FAILED_COUNT="$(systemctl --failed --no-legend 2>/dev/null | wc -l)"

if [ -n "$TEMP_RAW" ]; then
  TEMP_INT="${TEMP_RAW%.*}"
  if [ "$TEMP_INT" -ge 75 ]; then
    echo "⚠️ Temperature is high: ${TEMP_RAW}°C"
    WARN=1
  elif [ "$TEMP_INT" -ge 65 ]; then
    echo "⚠️ Temperature is warm: ${TEMP_RAW}°C"
    WARN=1
  else
    echo "✅ Temperature OK: ${TEMP_RAW}°C"
  fi
else
  echo "⚠️ Could not read temperature"
  WARN=1
fi

section "Power / throttling"
THROTTLED_RAW="$(vcgencmd get_throttled 2>/dev/null || echo "throttled=unknown")"
echo "$THROTTLED_RAW"

THROTTLED_VALUE="$(echo "$THROTTLED_RAW" | cut -d= -f2)"


if [ "${ROOT_USE:-0}" -ge 85 ]; then
  echo "⚠️ Root disk usage high: ${ROOT_USE}%"
  WARN=1
else
  echo "✅ Root disk usage OK: ${ROOT_USE}%"
fi

if [ -n "${SSD_USE:-}" ]; then
  if [ "$SSD_USE" -ge 85 ]; then
    echo "⚠️ SSD usage high: ${SSD_USE}%"
    WARN=1
  else
    echo "✅ SSD usage OK: ${SSD_USE}%"
  fi
else
  echo "⚠️ SSD /mnt/ssd not mounted or not readable"
  WARN=1
fi

if [ "$MEM_AVAIL_MB" -lt 500 ]; then
  echo "⚠️ Low available memory: ${MEM_AVAIL_MB} MB"
  WARN=1
else
  echo "✅ Memory OK: ${MEM_AVAIL_MB} MB available"
fi

if [ "$FAILED_COUNT" -gt 0 ]; then
  echo "⚠️ Failed systemd services: $FAILED_COUNT"
  WARN=1
else
  echo "✅ No failed systemd services"
fi

if [ "$WARN" -eq 0 ]; then
  echo
  echo "✅ Overall: Pi looks healthy"
else
  echo
  echo "⚠️ Overall: check warnings above"
fi

section "Uptime and load"
uptime
LOAD1="$(awk '{print $1}' /proc/loadavg)"
CORES="$(nproc)"
echo "CPU cores: $CORES"
echo "1-min load: $LOAD1"

section "IP addresses"
ip -4 -brief addr show | awk '{print $1 ": " $3}'

section "Disk"
df -h / /boot/firmware /mnt/ssd 2>/dev/null

section "Memory"
free -h

section "Temperature"
vcgencmd measure_temp 2>/dev/null || echo "vcgencmd temperature unavailable"

section "Power / throttling"
THROTTLED_RAW="$(vcgencmd get_throttled 2>/dev/null || echo "throttled=unknown")"
echo "$THROTTLED_RAW"

THROTTLED_VALUE="$(echo "$THROTTLED_RAW" | cut -d= -f2)"

if [ "$THROTTLED_VALUE" = "0x0" ]; then
  echo "✅ Power and throttling status OK"
  echo "Meaning: no undervoltage or throttling has been detected since boot."
else
  echo "⚠️ Throttling/undervoltage detected"
  echo "Meaning: the Pi has seen a power or thermal problem since boot."
  echo "Common causes: weak power supply, bad USB-C cable, overheating, or heavy CPU load."
fi

section "Failed services"
FAILED="$(systemctl --failed --no-legend --plain 2>/dev/null || true)"
if [ -z "$FAILED" ]; then
  echo "✅ No failed services"
else
  echo "⚠️ Failed services found:"
  echo "$FAILED"
fi

section "Important services"
for svc in ssh openvpn@server ollama suricata pihole-FTL docker; do
  if systemctl list-unit-files "$svc.service" >/dev/null 2>&1 || systemctl status "$svc" >/dev/null 2>&1; then
    state="$(systemctl is-active "$svc" 2>/dev/null || echo inactive)"
    echo "$svc: $state"
  fi
done

section "Pi Agent timers"
systemctl list-timers 'pi-agent*' --no-pager 2>/dev/null || echo "No pi-agent timers found"

section "VPN"
if ss -lunp 2>/dev/null | grep -q ':1194'; then
  echo "✅ OpenVPN UDP 1194 is listening"
  ss -lunp | grep ':1194' || true
else
  echo "⚠️ OpenVPN UDP 1194 not seen listening"
fi

if ip addr | grep -q '10.224.39.1'; then
  echo "✅ VPN interface/IP present: 10.224.39.1"
else
  echo "⚠️ VPN IP 10.224.39.1 not found"
fi

section "Pi-hole"

if command -v pihole >/dev/null 2>&1; then
  echo "Mode: host install"
  echo "pihole command: $(command -v pihole)"
  pihole status 2>/dev/null || true
elif docker ps --format '{{.Names}} {{.Status}} {{.Ports}}' 2>/dev/null | grep -qi '^pihole '; then
  echo "Mode: Docker"
  docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}' | grep -E '^NAMES|^pihole'
  echo
  echo "✅ Pi-hole container is running"
  echo "Admin UI: http://192.168.0.76:8081/admin"

  if ss -lntup 2>/dev/null | grep -E ':(53)\b' >/dev/null; then
    echo "✅ DNS port 53 is listening on the Pi"
  else
    echo "⚠️ DNS port 53 does not appear to be listening"
  fi
elif systemctl status pihole-FTL >/dev/null 2>&1; then
  echo "Mode: host service"
  echo "pihole command not found, but pihole-FTL service exists:"
  systemctl is-active pihole-FTL
else
  echo "⚠️ Pi-hole not found as host install, service, or Docker container"
fi

echo
echo "DNS/Web listeners:"
ss -lntup 2>/dev/null | grep -E ':(53|80|443|8081)\b' || echo "No DNS/Web listeners found"

section "Suricata"
if systemctl status suricata >/dev/null 2>&1; then
  echo "Service: $(systemctl is-active suricata 2>/dev/null)"
else
  echo "Suricata service not found"
fi

if [ -f /var/log/suricata/eve.json ]; then
  echo "eve.json: present"
  echo "Size: $(du -h /var/log/suricata/eve.json | awk '{print $1}')"
  echo "Recent alert count:"
  sudo jq -r 'select(.event_type=="alert")' /var/log/suricata/eve.json 2>/dev/null | wc -l
  echo "Latest alerts:"
  sudo jq -r 'select(.event_type=="alert") | [.timestamp, .src_ip, "->", .dest_ip, .alert.signature] | @tsv' /var/log/suricata/eve.json 2>/dev/null | tail -5
else
  echo "No /var/log/suricata/eve.json found"
fi

section "Docker"
if command -v docker >/dev/null 2>&1; then
  docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}' 2>/dev/null || echo "Docker installed but cannot list containers"
  echo
  echo "Docker networks:"
  docker network ls 2>/dev/null || true
else
  echo "Docker not installed or not in PATH"
fi

section "Ollama"
if systemctl status ollama >/dev/null 2>&1; then
  echo "Service: $(systemctl is-active ollama 2>/dev/null)"
fi

if command -v ollama >/dev/null 2>&1; then
  ollama list 2>/dev/null || echo "Could not list Ollama models"
else
  echo "ollama command not found"
fi

section "Network watch latest"
if [ -f "$LOG" ]; then
  tail -20 "$LOG"
else
  echo "No network-watch log found"
fi

section "Security notes"
echo "- Pi-hole only sees DNS from devices using Pi-hole as DNS."
echo "- Suricata only sees traffic visible to this Pi."
echo "- Unknown devices in network-watch should be checked with /devices and /scan."
echo "- For full network IDS, traffic must pass through the Pi/router or be mirrored to it."
