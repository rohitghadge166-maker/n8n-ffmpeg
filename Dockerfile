FROM n8nio/n8n:latest

USER root

RUN apk update && \
    apk add --no-cache ffmpeg curl python3

# yt-dlp binary kur (pip kullanmadan)
RUN curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp \
    -o /usr/local/bin/yt-dlp && \
    chmod +x /usr/local/bin/yt-dlp

USER node
