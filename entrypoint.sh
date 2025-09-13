#!/bin/bash
set -e

echo "[INFO] Enabling swap file..."
# Swap file created at build time, just enable it
swapon /swapfile || echo "[WARN] Swap already enabled or failed"

# Show free memory
free -h

# Increase Node.js heap size
export NODE_OPTIONS="--max-old-space-size=1024"

# Supabase DB connection settings (environment vars preferred)
DB_HOST="${DB_HOST:-your-db-host.supabase.co}"
DB_PORT="${DB_PORT:-6543}"

echo "[INFO] Checking Supabase connectivity..."
for i in {1..30}; do
  if nc -z "$DB_HOST" "$DB_PORT"; then
    echo "[INFO] ✅ Database reachable. Starting n8n..."
    break
  else
    echo "[WARN] DB not reachable yet, retrying in 5s..."
    sleep 5
  fi
done

# Start n8n normally
exec n8n
