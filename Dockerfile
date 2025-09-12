FROM n8nio/n8n:latest

# Install ffmpeg (Alpine uses apk)
USER root
RUN apk add --no-cache ffmpeg

# Enable 1GB swap file for extra virtual memory
RUN fallocate -l 1G /swapfile && \
    chmod 600 /swapfile && \
    mkswap /swapfile

# Set NODE_OPTIONS for safe memory limit (384 MB)
ENV NODE_OPTIONS="--max-old-space-size=384"

# Create a custom entrypoint to enable swap before starting n8n

# Switch back to n8n user (important)
USER node
