# Base n8n image (Debian based, apt-get available)
FROM n8nio/n8n:latest

# Install ffmpeg
USER root
RUN apt-get update && apt-get install -y ffmpeg && rm -rf /var/lib/apt/lists/*

# Switch back to n8n user (important, n8n runs as node user)
USER node
