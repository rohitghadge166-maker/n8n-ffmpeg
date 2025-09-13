#!/bin/bash
set -e

echo "[INFO] Creating swap file for extra RAM..."
# 🔥 4GB Swap bana rahe hain (free plan me bhi chalega)
sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo "[INFO] Swap enabled. Free memory now:"
free -h

# Increase Node.js heap to 1GB
export NODE_OPTIONS="--max-old-space-size=1024"

# Wait until Supabase DB is reachable
DB_HOST="${DB_HOST:-your-db-host.supabase.co}"
DB_PORT="${DB_PORT:-6543}"

echo "[INFO] Checking Supabase connectivity..."
for i in {1..30}; do
  if nc -z "$DB_HOST" "$DB_PORT"; then
    echo "[INFO] ✅ Database is reachable. Starting n8n..."
    break
  else
    echo "[WARN] DB not reachable yet, retrying in 5s..."
    sleep 5
  fi
done

# Start n8n
exec n8n
