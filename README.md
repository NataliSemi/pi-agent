# Pi Agent

Pi Agent is a Raspberry Pi-based cybersecurity and network monitoring project designed to help observe activity on a local network, identify unfamiliar devices, review Suricata alerts, investigate DNS and device information, and generate security news digests.

The project combines a collection of Python and shell scripts into a lightweight monitoring toolkit that can run directly on a Raspberry Pi. It is intended as both a practical home-lab security tool and a learning project for experimenting with network visibility, automation, alerting, and security analysis.

## Features

- Scan the local network for connected devices
- Detect and track unknown or newly discovered devices
- Maintain trusted-device and device-label information locally
- Investigate individual IP addresses and network devices
- Review Suricata alerts and network flows
- Perform DNS-related device checks
- Monitor basic system and network health
- Send alerts and interact with the agent through Telegram
- Generate and display cybersecurity news digests
- Provide helper scripts for common monitoring and investigation tasks

## Project Structure

Some of the main components include:

- `agent.py` — main Pi Agent logic
- `network-watch.sh` — network monitoring
- `scan-current-devices.sh` — scan devices currently visible on the network
- `scan-device.sh` — investigate an individual device
- `identify-one.sh` — assist with identifying a particular device
- `dns-device.sh` — DNS-related device investigation
- `suricata-alerts.sh` — review Suricata alerts
- `suricata-flows.sh` — inspect Suricata network-flow information
- `health-check.sh` — basic system/service health checks
- `telegram-commands.sh` — Telegram command integration
- `secnews/` — security-news collection and digest functionality

## Requirements

The exact requirements depend on which parts of the project are used, but the project is designed around a Linux-based Raspberry Pi environment.

Typical requirements include:

- Raspberry Pi OS / Debian-based Linux
- Python 3
- Bash
- Git
- Suricata
- Network scanning utilities
- Python dependencies listed in `secnews/requirements.txt`

Install the Python dependencies for the security-news component with:

```bash
pip install -r secnews/requirements.txt
```

Using a Python virtual environment is recommended.

## Installation

Clone the repository:

```bash
git clone git@github.com:NataliSemi/pi-agent.git
cd pi-agent
```

Review the scripts before running them and install any system packages required by the features you want to use.

## Configuration

Pi Agent may use credentials for services such as Telegram.

**Do not place real API keys, bot tokens, passwords, or other credentials directly in files committed to Git.**

Sensitive values should instead be stored in:

- environment variables
- an ignored `.env` file
- another local configuration file excluded through `.gitignore`

For example:

```bash
export TELEGRAM_BOT_TOKEN="your-token-here"
```

Applications can then read the value from the environment rather than storing it in source code.

## Sensitive Local Data

Some Pi Agent components generate information that should normally remain local to the Raspberry Pi, including:

- discovered IP addresses
- MAC addresses
- trusted-device lists
- device labels
- investigation results
- Telegram state/offset information
- Suricata/runtime data
- local databases
- logs and backup files

These files should not normally be committed to a public GitHub repository.

The project's `.gitignore` is used to prevent local runtime data, secrets, databases, temporary files, virtual environments, and backups from being accidentally uploaded.

## Usage

Run the main Python agent with:

```bash
python3 agent.py
```

Individual helper scripts can also be executed separately, for example:

```bash
./scan-current-devices.sh
./suricata-alerts.sh
./health-check.sh
```

Some scripts may require elevated privileges depending on the network tools or system resources they access.

## Security

Before committing or publishing changes, check that no credentials or sensitive local information are being tracked.

Useful checks include:

```bash
git status
git diff --cached
```

The repository can also be scanned with tools such as Gitleaks before pushing changes to GitHub.

Never publish:

- Telegram bot tokens
- API keys
- passwords
- private keys
- authentication credentials
- `.env` files containing secrets
- sensitive local network inventories

If a credential is accidentally exposed, revoke or rotate it rather than simply deleting it from the source code.

## Purpose

Pi Agent is primarily a personal cybersecurity, automation, and learning project.

It provides a practical environment for exploring:

- network monitoring
- device discovery
- intrusion detection
- security alert analysis
- scripting and automation
- Linux administration
- Python development
- Telegram-based notifications
- cybersecurity news monitoring

The project is expected to evolve as additional monitoring, analysis, and automation capabilities are added.

## Disclaimer

This project is intended for use on networks and systems that you own or are authorized to monitor.

Always ensure that network scanning, monitoring, and security testing activities comply with applicable laws, organizational policies, and authorization requirements.
