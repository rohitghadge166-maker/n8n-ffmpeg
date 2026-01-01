FROM n8nio/n8n:latest

USER root

# Debian आधारित इमेज के लिए apt-get का उपयोग करें
RUN apt-get update && \
    apt-get install -y ffmpeg && \
    rm -rf /var/lib/apt/lists/*

USER node

EXPOSE 5678

CMD ["start", "--verbose"]
