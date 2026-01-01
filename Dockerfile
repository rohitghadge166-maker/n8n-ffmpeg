# Use an older n8n version that still lets us install packages
FROM n8nio/n8n:1.77.0

# Switch to root so we can install system tools
USER root

# Install ffmpeg + python3 + pip + yt-dlp
RUN apt-get update && \
    apt-get install -y ffmpeg python3 python3-pip && \
    pip3 install --no-cache-dir yt-dlp && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# (Optional) Check versions so you’ll see them in build logs
RUN ffmpeg -version && yt-dlp --version

# Back to n8n user to run the application
USER node
