FROM ghcr.io/openclaw/openclaw:latest

USER root

# Create config directory  
RUN mkdir -p /home/node/.openclaw && chown -R node:node /home/node/.openclaw

# Copy config file with gateway bind settings
COPY openclaw.json /home/node/.openclaw/openclaw.json
RUN chown node:node /home/node/.openclaw/openclaw.json

USER node

# Override CMD to include --bind lan
CMD ["node", "dist/index.js", "gateway", "--bind", "lan", "--port", "18789", "--allow-unconfigured"]
