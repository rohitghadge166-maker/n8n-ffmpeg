# Base image
FROM n8nio/n8n:latest

# Switch to root to install packages
USER root

# Install dependencies: ffmpeg, python3, pip, bash, curl
RUN apk update && \
    apk add --no-cache \
      ffmpeg \
      python3 \
      py3-pip \
      bash \
      curl \
      git \
      unzip && \
    python3 -m ensurepip && \
    pip3 install --no-cache-dir --upgrade pip yt-dlp

# Verify installation (optional, Render logs me dekh sakte ho)
RUN ffmpeg -version && yt-dlp --version

# Switch back to n8n user
USER node
