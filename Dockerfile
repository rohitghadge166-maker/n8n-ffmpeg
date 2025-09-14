FROM n8nio/n8n:latest 
# Install ffmpeg (Alpine uses apk, not apt-get) 
USER root RUN apk add --no-cache ffmpeg 
# Switch back to n8n user (important, n8n runs as node user) 
USER node
