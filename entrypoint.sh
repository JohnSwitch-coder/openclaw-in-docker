#!/bin/sh
set -eu

ORIGIN="${OPENCLAW_CONTROL_UI_ORIGIN:-https://openclaw-in-docker.onrender.com}"
PORT="${OPENCLAW_GATEWAY_PORT:-18789}"
TOKEN="${OPENCLAW_GATEWAY_TOKEN:-12345678}"

echo "==> Configuring OpenClaw"
echo "    Allowed origin: ${ORIGIN}"
echo "    Gateway port:   ${PORT}"

openclaw config set gateway.mode local
openclaw config set gateway.auth.mode token
openclaw config set gateway.auth.token "${TOKEN}"
openclaw config set gateway.controlUi.allowedOrigins "[\"${ORIGIN}\"]"

echo "==> Starting OpenClaw Gateway"

exec openclaw gateway --bind 0.0.0.0 --port "${PORT}"
