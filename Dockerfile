FROM n8nio/n8n:latest

# Install ffmpeg and yt-dlp
USER root
RUN apt-get update && \
    apt-get install -y ffmpeg python3-pip && \
    pip3 install --no-cache-dir yt-dlp && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Switch back to n8n user
USER node
