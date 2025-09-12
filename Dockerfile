FROM n8nio/n8n:latest

USER root
RUN apk add --no-cache ffmpeg

RUN fallocate -l 1G /swapfile && \
    chmod 600 /swapfile && \
    mkswap /swapfile

ENV NODE_OPTIONS="--max-old-space-size=384"

# Bas apna startup CMD badal do
CMD sh -c "swapon /swapfile && exec n8n"

USER node
