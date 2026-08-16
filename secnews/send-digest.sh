#!/bin/bash

DIGEST_DIR="/home/raspberryjazz/pi-agent/secnews/digests"
LATEST=$(ls -t "$DIGEST_DIR"/security_digest_*.md 2>/dev/null | head -n 1)

if [ -z "$LATEST" ]; then
    echo "No digest found."
    exit 1
fi

echo "Latest digest: $LATEST"

# For now, print it.
# Later we connect this to your Telegram bot.
cat "$LATEST"
