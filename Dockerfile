FROM n8nio/n8n:latest

# Switch to root to install dependencies & setup swap
USER root

# Install ffmpeg + swap tools (Alpine lightweight tools)
RUN apk add --no-cache ffmpeg util-linux

# Create 1GB swap file safely
RUN fallocate -l 1G /swapfile && \
    chmod 600 /swapfile && \
    mkswap /swapfile && \
    swapon /swapfile || true && \
    echo "/swapfile swap swap defaults 0 0" >> /etc/fstab

# Set Node memory limit to 384MB (avoid OOM crash)
ENV NODE_OPTIONS="--max-old-space-size=384"

# Switch back to node user for n8n to run safely
USER node
