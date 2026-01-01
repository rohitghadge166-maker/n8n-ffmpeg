# n8n का स्टेबल इमेज (Debian आधारित)
FROM n8nio/n8n:latest

# रूट यूजर के रूप में ffmpeg इंस्टॉल करें
USER root

# Debian के लिए apt-get का सही सिंटैक्स
RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# सुरक्षा के लिए वापस node यूजर पर स्विच करें
USER node

# Render के लिए पोर्ट एक्सपोज़ करें
EXPOSE 5678

# n8n स्टार्ट कमांड
CMD ["start"]
