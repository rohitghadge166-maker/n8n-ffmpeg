# n8n with FFmpeg on Render

This repo lets you deploy **n8n** on Render with **FFmpeg** available.

## Deploy (Render)
1) Create New Web Service → connect this repo  
2) Environment: **Docker**  
3) Add Env Vars (suggested):
   - N8N_BASIC_AUTH_ACTIVE=true
   - N8N_BASIC_AUTH_USER=yourusername
   - N8N_BASIC_AUTH_PASSWORD=yourpassword
   - WEBHOOK_TUNNEL_URL=https://your-service.onrender.com/
   - N8N_HOST=0.0.0.0
   - N8N_PORT=5678

After deploy, test inside n8n → Execute Command:
