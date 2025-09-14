# n8n official image use karo
FROM n8nio/n8n:latest

# Render ko batane ke liye port expose karo
ENV PORT=5678

# n8n start command
CMD ["n8n", "start"]
