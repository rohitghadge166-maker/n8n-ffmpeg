# ✅ Official n8n image
FROM n8nio/n8n:latest

# ✅ Internal port set
ENV PORT=5678

# ✅ Expose port (good practice)
EXPOSE 5678

# ✅ Start n8n
CMD ["n8n", "start"]
