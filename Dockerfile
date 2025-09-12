FROM n8nio/n8n:latest

USER root
RUN apk add --no-cache ffmpeg

# Swap file create
RUN fallocate -l 1G /swapfile && \
    chmod 600 /swapfile && \
    mkswap /swapfile

# Memory limit
ENV NODE_OPTIONS="--max-old-space-size=384"

# CMD with full path to sh
CMD ["/bin/sh", "-c", "swapon /swapfile && exec n8n"]

# Run as n8n user after swap
USER node
