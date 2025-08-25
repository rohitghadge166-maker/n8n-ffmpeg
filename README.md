# n8n + ffmpeg on Render

This repo contains a Docker setup for deploying **n8n** with **ffmpeg** on Render.

## 🚀 Deploy on Render

1. Fork or upload this repo to your GitHub.
2. Go to [Render](https://render.com).
3. Create a **New Web Service** → Select this repo.
4. Choose **Runtime = Docker**.
5. Add Environment Variables in Render:
   - `N8N_BASIC_AUTH_ACTIVE=true`
   - `N8N_BASIC_AUTH_USER=admin`
   - `N8N_BASIC_AUTH_PASSWORD=yourpassword`
   - `N8N_HOST=0.0.0.0`
   - `N8N_PORT=5678`
   - `NODE_ENV=production`
6. Deploy 🚀

Now your n8n instance has ffmpeg available inside it.
