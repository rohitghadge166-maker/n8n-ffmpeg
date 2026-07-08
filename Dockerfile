FROM n8nio/n8n:latest

USER root

RUN apk add --no-cache \
    ffmpeg \
    python3 \
    py3-pip \
    && ln -sf python3 /usr/bin/python \
    && pip3 install --no-cache-dir --break-system-packages yt-dlp \
    && apk cache clean

USER node
