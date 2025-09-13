# Base n8n image
FROM n8nio/n8n:latest

# Install util-linux + bash (for swap and script)
USER root
RUN apk add --no-cache util-linux bash

# Create 4GB swap during build (optional)
RUN fallocate -l 4G /swapfile && chmod 600 /swapfile && mkswap /swapfile

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Switch back to node user
USER node

# Use custom entrypoint
ENTRYPOINT ["/entrypoint.sh"]
