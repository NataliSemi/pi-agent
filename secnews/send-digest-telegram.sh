#!/bin/bash

set -u

ENV_FILE="/etc/pi-agent/telegram.env"
BASE_DIR="/home/raspberryjazz/pi-agent/secnews"
DB="$BASE_DIR/security_news.db"
QUESTIONS="$BASE_DIR/questions.json"
DIGEST_DIR="$BASE_DIR/digests"

source "$ENV_FILE"

send_telegram() {
  local message="$1"
  curl -s \
    --data-urlencode "chat_id=${CHAT_ID}" \
    --data-urlencode "text=${message}" \
    "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" >/dev/null
}

send_document() {
  local file="$1"
  curl -s \
    -F "chat_id=${CHAT_ID}" \
    -F "document=@${file}" \
    -F "caption=Full Security+ digest" \
    "https://api.telegram.org/bot${BOT_TOKEN}/sendDocument" >/dev/null
}

LATEST=$(ls -t "$DIGEST_DIR"/security_digest_*.md 2>/dev/null | head -n 1)

BRIEF="$("$BASE_DIR/venv/bin/python" <<'PY'
import sqlite3
import json
import random
from pathlib import Path
from datetime import datetime

BASE_DIR = Path("/home/raspberryjazz/pi-agent/secnews")
DB = BASE_DIR / "security_news.db"
QUESTIONS = BASE_DIR / "questions.json"

def load_questions():
    with open(QUESTIONS, "r", encoding="utf-8") as f:
        return json.load(f)

def classify(title, content):
    text = f"{title} {content}".lower()

    if any(k in text for k in ["fortinet", "vpn", "firewall", "cve", "patch", "vulnerability", "exploit", "zero-day"]):
        return "Vulnerability management, patching, and exposed services", "vulnerability"

    if any(k in text for k in ["ransomware", "extortion", "data leak", "leak site", "encrypt"]):
        return "Ransomware, backups, and incident response", "ransomware"

    if any(k in text for k in ["phishing", "credential", "mfa", "social engineering", "scattered spider", "sim swapping"]):
        return "Phishing, MFA, and social engineering", "phishing"

    if any(k in text for k in ["critical infrastructure", "critical systems", "hostile states", "state actor", "nation state"]):
        return "Critical infrastructure and state-sponsored threats", "critical infrastructure"

    if any(k in text for k in ["breach", "data breach", "personal data", "patient", "healthtech"]):
        return "Data breaches, privacy, and impact assessment", "default"

    if any(k in text for k in ["ai", "artificial intelligence"]):
        return "AI risk, governance, and security awareness", "default"

    return "Risk management and security operations", "default"

def choose_question(bank, topic):
    return random.choice(bank.get(topic, bank["default"]))

conn = sqlite3.connect(DB)
cur = conn.cursor()
today = datetime.now().strftime("%Y-%m-%d")

cur.execute("""
    SELECT title, source, link, content
    FROM articles
    WHERE substr(created_at, 1, 10) = ?
    ORDER BY id DESC
    LIMIT 5
""", (today,))
rows = cur.fetchall()
conn.close()

bank = load_questions()

lines = []
lines.append(f"🛡️ Security+ Morning Brief - {today}")
lines.append("")

if not rows:
    lines.append("No new cybersecurity articles were collected overnight.")
    lines.append("")
    lines.append("Your Pi did check the feeds, but nothing new was saved.")
    lines.append("This is normal when RSS feeds have not changed.")
    print("\n".join(lines))
    raise SystemExit

lines.append("Top new cyber stories collected overnight:")
lines.append("")

for i, (title, source, link, content) in enumerate(rows, start=1):
    focus, topic = classify(title, content)
    quiz = choose_question(bank, topic)

    lines.append(f"{i}) {title}")
    lines.append(f"Source: {source}")
    lines.append(f"Read: {link}")
    lines.append(f"Security+ focus: {focus}")
    lines.append("")
    lines.append(f"Practice: {quiz['question']}")

    for letter, choice in quiz["choices"].items():
        lines.append(f"{letter}) {choice}")

    lines.append(f"Answer: {quiz['answer']}")
    lines.append(f"Why: {quiz['explanation']}")
    lines.append("")
    lines.append("---")
    lines.append("")

message = "\n".join(lines)

print(message[:3900])
PY
)"

if [ -z "$BRIEF" ]; then
  send_telegram "⚠️ Security+ brief could not be created."
  exit 1
fi

send_telegram "$BRIEF"

if [ -n "$LATEST" ]; then
  send_document "$LATEST"
fi
