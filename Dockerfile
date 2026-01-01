# Use an older n8n version as base so we can install system packages
FROM docker.n8n.io/n8nio/n8n:1.123.9

USER root

# Update + install system tools + ffmpeg + python/pip
RUN apt-get update && \
    apt-get install -y ffmpeg python3 python3-pip curl && \
    pip3 install --no-cache-dir yt-dlp && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Verify tools (optional — you can remove this)
RUN ffmpeg -version && yt-dlp --version

USER node
