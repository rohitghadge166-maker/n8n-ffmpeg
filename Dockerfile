FROM n8nio/n8n:latest

# Switch to root for installing packages
USER root

# Create 1GB swapfile for extra virtual memory
RUN fallocate -l 1G /swapfile && \
    chmod 600 /swapfile && \
    mkswap /swapfile

# Set Node memory limit (384 MB safe for Render free tier)
ENV NODE_OPTIONS="--max-old-space-size=384"

# Create a reliable start script
RUN printf '#!/bin/bash\n\
set -e\n\
swapon /swapfile || echo "swap already active or failed"\n\
exec n8n\n' > /usr/local/bin/custom-start.sh \
    && chmod +x /usr/local/bin/custom-start.sh

# Use the custom script as entrypoint
ENTRYPOINT ["/usr/local/bin/custom-start.sh"]

# Switch back to non-root user (important for security)
USER node
