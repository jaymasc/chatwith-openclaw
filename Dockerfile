FROM ghcr.io/openclaw/openclaw:latest

# Create config directory  
RUN mkdir -p /home/node/.openclaw

# Copy config file (will be overwritten at runtime with env substitution)
COPY openclaw.json /home/node/.openclaw/openclaw.json

# Use entrypoint wrapper to substitute env vars in config
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
