ARG N8N_VERSION=latest
ARG ALPINE_VERSION=3.22

# Step 1: Minimal Alpine for apk-tools
FROM alpine:${ALPINE_VERSION} AS apktools
RUN apk add --no-cache apk-tools-static

# Step 2: Base n8n image
FROM n8nio/n8n:${N8N_VERSION}

ARG ALPINE_VERSION

USER root

# Step 3: Restore apk-tools (n8n removes them)
COPY --from=apktools /sbin/apk.static /sbin/apk.static
COPY --from=apktools /etc/apk/keys /tmp/apk-keys
RUN mkdir -p /etc/apk /etc/apk/keys \
    && cp -n /tmp/apk-keys/* /etc/apk/keys/ || true \
    && printf 'https://dl-cdn.alpinelinux.org/alpine/v%s/main\nhttps://dl-cdn.alpinelinux.org/alpine/v%s/community\n' "$ALPINE_VERSION" "$ALPINE_VERSION" > /etc/apk/repositories \
    && /sbin/apk.static -X "https://dl-cdn.alpinelinux.org/alpine/v${ALPINE_VERSION}/main" -U add apk-tools \
    && rm -f /sbin/apk.static \
    && rm -rf /tmp/apk-keys

# Step 4: Install FFmpeg + yt-dlp + Python (yt-dlp needs Python)
RUN apk add --no-cache \
        ffmpeg \
        ffmpeg-dev \
        python3 \
        py3-pip \
    && pip3 install --no-cache-dir yt-dlp \
    && rm -rf /var/cache/apk/*

# Step 5: Switch back to n8n default user
USER node

# Step 6: Verify installations
RUN n8n --version \
    && ffmpeg -version \
    && ffprobe -version \
    && yt-dlp --version
