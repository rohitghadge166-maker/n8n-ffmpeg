# Base n8n image
FROM n8nio/n8n:latest

# Switch to root to install util-linux + bash (optional, for debugging)
USER root
RUN apk add --no-cache util-linux bash

# Switch back to n8n user
USER node
