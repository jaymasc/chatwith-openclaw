#!/bin/sh
set -e

# Substitute env vars in config
if [ -n "$TELEGRAM_BOT_TOKEN" ]; then
  sed -i "s/TELEGRAM_BOT_TOKEN_PLACEHOLDER/$TELEGRAM_BOT_TOKEN/g" /home/node/.openclaw/openclaw.json
fi

# Run the original entrypoint
exec node /app/dist/index.js "$@"
