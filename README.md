# Pi Agent

Pi Agent is a Raspberry Pi-based cybersecurity and network monitoring project that combines local network visibility, automation, intrusion-detection tooling, Telegram interaction, security-news processing, and a locally hosted language model.

The Raspberry Pi acts as an always-on local security assistant. It can observe network activity, help identify unfamiliar devices, review Suricata alerts and flows, run investigation scripts, generate security-news digests, and use a local LLM for analysis without depending on a cloud-hosted model for every task.

## Features

* Scan the local network for connected devices
* Detect and track unknown or newly discovered devices
* Maintain trusted-device and device-label information
* Investigate individual IP addresses and devices
* Perform DNS-related device checks
* Review Suricata alerts
* Inspect Suricata network flows
* Monitor system and network health
* Interact with the agent through Telegram
* Collect and summarize cybersecurity news
* Run a local LLM directly on the Raspberry Pi
* Use AI-assisted analysis for local monitoring and investigation workflows

## Local LLM

One of the core ideas behind Pi Agent is running an LLM locally on the Raspberry Pi.

The local model can be used as an analysis layer for information collected by the agent, allowing the Pi to process security-related data and assist with investigation tasks directly on the device.

Depending on the available Raspberry Pi hardware and model size, the local LLM can be used for tasks such as:

* Summarizing security events
* Explaining Suricata alerts
* Interpreting network observations
* Reviewing device investigation results
* Generating concise security reports
* Answering questions about locally collected information
* Assisting with cybersecurity learning and analysis

Running the model locally also makes the Raspberry Pi more than a collection of monitoring scripts — it becomes a small self-hosted AI security assistant.

## Project Structure

Some of the main components include:

* `agent.py` — main Pi Agent logic
* `network-watch.sh` — network monitoring
* `scan-current-devices.sh` — scan devices currently visible on the network
* `scan-device.sh` — investigate an individual device
* `identify-one.sh` — help identify a particular device
* `dns-device.sh` — DNS-related device investigation
* `suricata-alerts.sh` — review Suricata alerts
* `suricata-flows.sh` — inspect Suricata flow information
* `health-check.sh` — basic system and service checks
* `telegram-commands.sh` — Telegram command integration
* `secnews/` — cybersecurity news collection and digest functionality

## Requirements

Pi Agent is designed to run on a Linux-based Raspberry Pi environment.

Typical requirements include:

* Raspberry Pi
* Raspberry Pi OS or Debian-based Linux
* Python 3
* Bash
* Git
* Suricata
* Network scanning utilities
* A local LLM runtime
* Python dependencies listed in `secnews/requirements.txt`

Install the Python dependencies for the security-news component with:

```bash
pip install -r secnews/requirements.txt
```

A Python virtual environment can also be used for dependency management.

## Installation

Clone the repository:

```bash
git clone git@github.com:NataliSemi/pi-agent.git
cd pi-agent
```

Install the required system and Python dependencies for the components you want to run.

## Usage

Run the main agent with:

```bash
python3 agent.py
```

Individual components can also be executed separately:

```bash
./scan-current-devices.sh
./suricata-alerts.sh
./suricata-flows.sh
./health-check.sh
```

This makes it possible to use Pi Agent either as an integrated assistant or as a collection of independent monitoring and investigation tools.

## Security News Agent

The `secnews/` component collects cybersecurity news and creates digest-style summaries.

It can be used to:

* Track recent cybersecurity stories
* Build daily security digests
* Summarize important developments
* Generate security-learning material
* Deliver digest information through Telegram

This provides Pi Agent with both local network awareness and awareness of broader cybersecurity developments.

## Telegram Integration

Telegram provides a convenient remote interface to the Raspberry Pi agent.

Commands can be used to request information from the Pi, trigger monitoring or investigation functions, and receive results without needing to connect directly to the Raspberry Pi terminal.

This allows the system to operate as an always-on home-lab assistant that can be accessed remotely.

## Purpose

Pi Agent is a personal cybersecurity, AI, automation, and home-lab project.

The project provides a practical environment for experimenting with:

* Network monitoring
* Device discovery
* Intrusion detection
* Suricata
* Linux administration
* Bash scripting
* Python development
* Local language models
* AI-assisted security analysis
* Telegram automation
* Cybersecurity news monitoring

The goal is to gradually build a lightweight self-hosted security assistant that combines traditional monitoring tools with local AI capabilities on Raspberry Pi hardware.
