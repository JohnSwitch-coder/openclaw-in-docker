#!/bin/sh
set -eu

ORIGIN="${OPENCLAW_CONTROL_UI_ORIGIN:-https://web-terminal-latest-8a0n.onrender.com}"
PORT="${OPENCLAW_GATEWAY_PORT:-18789}"

echo "==> Configuring OpenClaw Control UI"
echo "    Allowed origin: ${ORIGIN}"
echo "    Gateway port:   ${PORT}"

openclaw config set gateway.controlUi.allowedOrigins "[\"${ORIGIN}\"]"

echo "==> Starting OpenClaw Gateway"

exec openclaw gateway --bind lan --port "${PORT}"
