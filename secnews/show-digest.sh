#!/bin/bash
LATEST=$(ls -t /home/raspberryjazz/pi-agent/secnews/digests/security_digest_*.md | head -n 1)

if [ -z "$LATEST" ]; then
  echo "No digest found."
  exit 1
fi

less "$LATEST"
