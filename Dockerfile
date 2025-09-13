# ✅ n8n + ffmpeg + util-linux + swap + custom entrypoint
FROM n8nio/n8n:latest

# Install ffmpeg + util-linux (swap banane ke liye)
USER root
RUN apk add --no-cache ffmpeg util-linux bash

# Copy custom entrypoint inside container
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Switch back to n8n user (important)
USER node

# Run our custom entrypoint instead of default
ENTRYPOINT ["/entrypoint.sh"]
