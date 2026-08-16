import feedparser
import sqlite3
import json
import random
import subprocess
import trafilatura
from datetime import datetime
from pathlib import Path

MODEL = "qwen2.5:1.5b"

BASE_DIR = Path(__file__).resolve().parent
DB_PATH = BASE_DIR / "security_news.db"
FEEDS_PATH = BASE_DIR / "feeds.txt"
DIGESTS_DIR = BASE_DIR / "digests"

DIGESTS_DIR.mkdir(exist_ok=True)

SECURITY_KEYWORDS = [
    "vulnerability", "malware", "ransomware", "phishing", "exploit",
    "patch", "zero-day", "breach", "cve", "botnet", "credential",
    "firewall", "vpn", "mfa", "iam", "cloud", "incident", "threat",
    "attack", "backdoor", "trojan", "spyware", "security update",
    "critical", "fortinet", "microsoft", "windows", "linux",
    "authentication", "authorization", "encryption", "risk", "siem",
    "edr", "xdr", "supply chain", "social engineering"
]


def init_db():
    conn = sqlite3.connect(DB_PATH)
    cur = conn.cursor()
    cur.execute("""
        CREATE TABLE IF NOT EXISTS articles (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            link TEXT UNIQUE,
            published TEXT,
            source TEXT,
            content TEXT,
            summary TEXT,
            created_at TEXT
        )
    """)
    conn.commit()
    conn.close()


def load_feeds():
    with open(FEEDS_PATH, "r", encoding="utf-8") as f:
        return [
            line.strip()
            for line in f
            if line.strip() and not line.startswith("#")
        ]


def article_exists(link):
    conn = sqlite3.connect(DB_PATH)
    cur = conn.cursor()
    cur.execute("SELECT 1 FROM articles WHERE link = ?", (link,))
    exists = cur.fetchone() is not None
    conn.close()
    return exists


def is_security_relevant(title, content):
    text = f"{title} {content}".lower()
    return any(keyword in text for keyword in SECURITY_KEYWORDS)


def ollama(prompt):
    try:
        import requests

        response = requests.post(
            "http://localhost:11434/api/generate",
            json={
                "model": MODEL,
                "prompt": prompt,
                "stream": False,
                "options": {
                    "temperature": 0.2,
                    "num_predict": 350
                }
            },
            timeout=300
        )

        response.raise_for_status()
        return response.json().get("response", "").strip()

    except Exception as e:
        return f"Ollama error: {e}"

def fetch_article_text(url):
    try:
        downloaded = trafilatura.fetch_url(url)
        if not downloaded:
            return ""

        text = trafilatura.extract(downloaded)
        if not text:
            return ""

        return text[:2500]

    except Exception as e:
        return f"Could not fetch article text: {e}"


def summarize_article(title, content):
    prompt = f"""
You are my CompTIA Security+ SY0-701 tutor.

Your task:
Summarise the cybersecurity relevance of this article only.
Ignore unrelated content, comments, ads, blogrolls, sidebars, and non-security sections.

Article title:
{title}

Article text:
{content[:2000]}

Return exactly this format:

Relevance:
High / Medium / Low

Reason:
One sentence explaining why this matters for cybersecurity learners.

Summary:
- Bullet 1
- Bullet 2
- Bullet 3

Security+ domain:
Choose one exact domain name:
1. General Security Concepts
2. Threats, Vulnerabilities, and Mitigations
3. Security Architecture
4. Security Operations
5. Security Program Management and Oversight

Key terms:
- Term 1
- Term 2
- Term 3

Defensive lesson:
One practical defensive takeaway.

Rules:
- Do not invent facts.
- Do not create a quiz.
- Do not ask questions.
- Keep it short.
"""
    return ollama(prompt)

def choose_question(title, content):
    questions_path = BASE_DIR / "questions.json"

    with open(questions_path, "r", encoding="utf-8") as f:
        bank = json.load(f)

    text = f"{title} {content}".lower()

    topic_map = {
        "phishing": ["phishing", "social engineering", "credential"],
        "ransomware": ["ransomware", "encrypt", "extortion"],
        "vulnerability": ["vulnerability", "cve", "patch", "exploit", "zero-day"],
        "critical infrastructure": ["critical infrastructure", "critical systems", "hostile states", "state actor"]
    }

    for topic, keywords in topic_map.items():
        if any(keyword in text for keyword in keywords):
            return random.choice(bank[topic])

    return random.choice(bank["default"])

def save_article(title, link, published, source, content, summary):
    conn = sqlite3.connect(DB_PATH)
    cur = conn.cursor()
    cur.execute("""
        INSERT OR IGNORE INTO articles
        (title, link, published, source, content, summary, created_at)
        VALUES (?, ?, ?, ?, ?, ?, ?)
    """, (
        title,
        link,
        published,
        source,
        content,
        summary,
        datetime.now().isoformat(timespec="seconds")
    ))
    conn.commit()
    conn.close()


def collect_news():
    feeds = load_feeds()

    for feed_url in feeds:
        print(f"[+] Reading feed: {feed_url}")
        feed = feedparser.parse(feed_url)
        source = feed.feed.get("title", feed_url)

        for entry in feed.entries[:8]:
            title = entry.get("title", "No title")
            link = entry.get("link", "")
            published = entry.get("published", "")

            if not link:
                continue

            if article_exists(link):
                print(f"[-] Already saved: {title}")
                continue

            print(f"[+] Checking article: {title}")

            content = fetch_article_text(link)
            if not content:
                content = title

            if not is_security_relevant(title, content):
                print(f"[-] Skipping low-relevance article: {title}")
                continue

            print(f"[+] Summarising: {title}")
            summary = summarize_article(title, content)
            save_article(title, link, published, source, content, summary)


def create_digest():
    today = datetime.now().strftime("%Y-%m-%d")

    conn = sqlite3.connect(DB_PATH)
    cur = conn.cursor()
    cur.execute("""
        SELECT title, link, source, published, content, summary
        FROM articles
        WHERE substr(created_at, 1, 10) = ?
        ORDER BY id DESC
        LIMIT 10
    """, (today,))
    rows = cur.fetchall()
    conn.close()

    digest_path = DIGESTS_DIR / f"security_digest_{today}.md"

    with open(digest_path, "w", encoding="utf-8") as f:
        f.write(f"# Cybersecurity + Security+ Digest - {today}\n\n")

        if not rows:
            f.write("No new cybersecurity articles were collected today.\n\n")
            f.write("This usually means the RSS feeds have not published anything new since the last run.\n")
            print(f"[+] Digest created with no new articles: {digest_path}")
            return

        for title, link, source, published, content, summary in rows:
            quiz = choose_question(title, content + " " + summary)

            f.write(f"## {title}\n\n")
            f.write(f"**Source:** {source}\n\n")
            f.write(f"**Published:** {published}\n\n")
            f.write(f"**Link:** {link}\n\n")
            f.write(summary)
            f.write("\n\n")

            f.write("### Security+ Practice Question\n\n")
            f.write(f"**Question:** {quiz['question']}\n\n")

            for letter, choice in quiz["choices"].items():
                f.write(f"{letter}) {choice}\n")

            f.write(f"\n**Correct answer:** {quiz['answer']}\n\n")
            f.write(f"**Explanation:** {quiz['explanation']}\n\n")
            f.write("---\n\n")

    print(f"[+] Digest created: {digest_path}")

def main():
    init_db()
    collect_news()
    create_digest()


if __name__ == "__main__":
    main()
