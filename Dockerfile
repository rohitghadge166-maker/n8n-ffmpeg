FROM n8nio/n8n:2.18.6

USER root

RUN apk add --no-cache \
    ffmpeg \
    python3 \
    py3-pip \
    && ln -sf /usr/bin/python3 /usr/bin/python \
    && pip3 install --no-cache-dir --break-system-packages yt-dlp \
    && rm -rf /var/cache/apk/*

USER node

ENV N8N_DISABLE_PRODUCTION_MAIN_PROCESS=false
