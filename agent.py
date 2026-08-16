#!/usr/bin/env python3
import json
import subprocess
import urllib.request

MODEL = "qwen2.5:1.5b"
OLLAMA_URL = "http://127.0.0.1:11434/api/chat"

SAFE_COMMANDS = {
    "disk": ["df", "-h"],
    "memory": ["free", "-h"],
    "uptime": ["uptime"],
    "failed_services": ["systemctl", "--failed", "--no-pager"],
    "openvpn": ["systemctl", "status", "openvpn@server", "--no-pager"],
    "ip": ["hostname", "-I"],
    "routes": ["ip", "route"],
    "ollama": ["ollama", "list"],
    "temperature": ["vcgencmd", "measure_temp"],
    "throttling": ["vcgencmd", "get_throttled"],
    "journal_openvpn": ["journalctl", "-u", "openvpn@server", "-n", "50", "--no-pager"],
    "ssh_status": ["systemctl", "status", "ssh", "--no-pager"],
    "storage": ["lsblk", "-f"],
    "network": ["ip", "-brief", "addr"],
    "devices": "sudo arp-scan --localnet",
    "device_changes": "/home/raspberryjazz/pi-agent/check-devices.sh",
    "ports_quick": "sudo nmap -Pn --top-ports 30 192.168.0.0/24",
}


def run_safe_tool(name: str) -> str:
    if name not in SAFE_COMMANDS:
        return f"Tool not allowed: {name}"

    try:
        result = subprocess.run(
            SAFE_COMMANDS[name],
            capture_output=True,
            text=True,
            timeout=15,
            check=False,
        )
        output = result.stdout.strip() or result.stderr.strip()
        return output[:4000]
    except Exception as e:
        return f"Error running tool {name}: {e}"


def ask_ollama(messages):
    data = json.dumps({
        "model": MODEL,
        "messages": messages,
        "stream": False,
    }).encode("utf-8")

    req = urllib.request.Request(
        OLLAMA_URL,
        data=data,
        headers={"Content-Type": "application/json"},
        method="POST",
    )

    with urllib.request.urlopen(req, timeout=120) as response:
        body = json.loads(response.read().decode("utf-8"))
        return body["message"]["content"]


SYSTEM = """
You are a cautious Raspberry Pi admin assistant.

You can suggest safe read-only commands.
You cannot run arbitrary commands.
The user can ask for these tools by name:
disk, memory, uptime, failed_services, openvpn, ip, routes, ollama.

If a tool result is provided, summarize it clearly.
Never suggest destructive commands like rm -rf, mkfs, dd, fdisk, parted, reboot, shutdown, or chmod/chown recursively unless the user explicitly asks and you explain the risk.
"""


def main():
    messages = [{"role": "system", "content": SYSTEM}]
    print("Pi Agent ready. Type 'exit' to quit.")
    print("Tools: disk, memory, uptime, failed_services, openvpn, ip, routes, ollama, temperature, throtteling")
    print("Use: /tool disk")

    while True:
        user_input = input("\nAsk> ").strip()

        if user_input.lower() in {"exit", "quit", "/bye"}:
            break

        if user_input.startswith("/tool "):
            tool = user_input.replace("/tool ", "", 1).strip()
            result = run_safe_tool(tool)
            messages.append({
                "role": "user",
                "content": f"Tool result for {tool}:\n{result}\n\nSummarize this for me.",
            })
        else:
            messages.append({"role": "user", "content": user_input})

        answer = ask_ollama(messages)
        messages.append({"role": "assistant", "content": answer})
        print("\nAgent:", answer)


if __name__ == "__main__":
    main()
