# Old stable n8n image
FROM n8nio/n8n:1.77.0

# Switch to root to install ffmpeg
USER root

# Install only ffmpeg
RUN apt-get update && \
    apt-get install -y ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Switch back to n8n user
USER node
