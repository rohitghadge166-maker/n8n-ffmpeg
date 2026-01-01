# Use prebuilt n8n image with ffmpeg + yt-dlp
FROM ghcr.io/cellulardata/n8n-ffmpeg-yt-dlp:latest

# Switch to root if you need extra packages (optional)
USER root

# Optional: add any small packages you need
# RUN apk add --no-cache bash curl git unzip

# Switch back to n8n user
USER node
