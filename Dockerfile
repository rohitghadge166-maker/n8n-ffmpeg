# Base image: official n8n
FROM n8nio/n8n:latest

# Switch to root user to install system packages
USER root

# Install ffmpeg
RUN apt-get update && apt-get install -y ffmpeg

# Switch back to node user (n8n runs on this user)
USER node
