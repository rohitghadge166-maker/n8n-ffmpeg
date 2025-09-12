FROM n8nio/n8n:latest

USER root
RUN apk add --no-cache ffmpeg

# Swap create
RUN fallocate -l 1G /swapfile && \
    chmod 600 /swapfile && \
    mkswap /swapfile

# Memory limit
ENV NODE_OPTIONS="--max-old-space-size=384"

# Custom entrypoint
RUN echo '#!/bin/bash\n\
swapon /swapfile || echo "swap failed (probably Render kernel)"\n\
exec n8n' > /start.sh && chmod +x /start.sh

ENTRYPOINT ["/start.sh"]

USER node
