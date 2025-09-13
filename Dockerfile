# Base n8n image
FROM n8nio/n8n:latest

# Install util-linux + bash (required for simple scripts)
USER root
RUN apk add --no-cache util-linux bash

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Switch back to n8n user
USER node

# Use custom entrypoint
ENTRYPOINT ["/entrypoint.sh"]
