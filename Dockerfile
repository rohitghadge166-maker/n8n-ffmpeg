# विशिष्ट वर्शन का उपयोग करना बेहतर है (जैसे n8nio/n8n:1.20.0), 
# लेकिन 'latest' भी काम करेगा।
FROM n8nio/n8n:latest

# रूट यूजर के रूप में ffmpeg इनस्टॉल करना
USER root
RUN apk add --no-cache ffmpeg

# वापस 'node' यूजर पर स्विच करना ताकि सुरक्षा बनी रहे
USER node

# पोर्ट 5678 को ओपन करना (n8n का डिफ़ॉल्ट पोर्ट)
EXPOSE 5678

# ENTRYPOINT को हटाने से ऑफिशियल स्क्रिप्ट चलेगी, जो बेहतर है।
# केवल CMD का उपयोग करें।
CMD ["start", "--verbose"]
