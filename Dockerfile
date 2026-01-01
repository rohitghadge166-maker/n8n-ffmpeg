ARG N8N_VERSION=latest
ARG ALPINE_VERSION=3.21

FROM alpine:${ALPINE_VERSION} AS apktools
RUN apk add --no-cache apk-tools-static

FROM n8nio/n8n:${N8N_VERSION}

ARG ALPINE_VERSION

USER root

# Reinstall apk-tools
COPY --from=apktools /sbin/apk.static /sbin/apk.static
COPY --from=apktools /etc/apk/keys /tmp/apk-keys
RUN mkdir -p /etc/apk /etc/apk/keys \
    && cp -n /tmp/apk-keys/* /etc/apk/keys/ || true \
    && printf 'https://dl-cdn.alpinelinux.org/alpine/v%s/main\nhttps://dl-cdn.alpinelinux.org/alpine/v%s/community\n' "$ALPINE_VERSION" "$ALPINE_VERSION" > /etc/apk/repositories \
    && /sbin/apk.static -X "https://dl-cdn.alpinelinux.org/alpine/v${ALPINE_VERSION}/main" -U add apk-tools \
    && rm -f /sbin/apk.static \
    && rm -rf /tmp/apk-keys

# FFmpeg, Python3 और yt-dlp को इंस्टॉल करना
RUN apk add --no-cache \
    ffmpeg \
    ffmpeg-dev \
    python3 \
    py3-pip \
    && ln -sf python3 /usr/bin/python \
    && pip install --no-cache-dir --break-system-packages yt-dlp \
    && rm -rf /var/cache/apk/*

# वापस node यूजर पर स्विच करें
USER node

# वेरिफिकेशन
RUN n8n --version \
    && ffmpeg -version \
    && python3 --version \
    && yt-dlp --version
