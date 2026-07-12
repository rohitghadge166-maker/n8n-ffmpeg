FROM n8nio/n8n:latest

USER root

RUN apk update && apk add --no-cache \
    ffmpeg \
    bash \
    curl \
    wget \
    tzdata

USER node
