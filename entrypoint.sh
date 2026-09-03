#!/bin/sh
set -eu

ORIGIN="${OPENCLAW_CONTROL_UI_ORIGIN:-https://web-terminal-latest-8a0n.onrender.com}"
PORT="${OPENCLAW_GATEWAY_PORT:-18789}"

echo "==> Configuring OpenClaw"
echo "    Allowed origin: ${ORIGIN}"
echo "    Gateway port:   ${PORT}"

# Set gateway mode first
openclaw config set gateway.mode local

# Set Control UI allowed origin
openclaw config set gateway.controlUi.allowedOrigins "[\"${ORIGIN}\"]"

echo "==> Starting OpenClaw Gateway"

exec openclaw gateway --bind lan --port "${PORT}"
