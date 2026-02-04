FROM ghcr.io/openclaw/openclaw:latest

USER root

# Create config directory  
RUN mkdir -p /home/node/.openclaw && chown -R node:node /home/node/.openclaw

# Copy config file
COPY openclaw.json /home/node/.openclaw/openclaw.json
RUN chown node:node /home/node/.openclaw/openclaw.json

# Copy entrypoint wrapper
COPY --chmod=755 entrypoint.sh /entrypoint.sh

USER node

ENTRYPOINT ["/entrypoint.sh"]
