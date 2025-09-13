#!/bin/bash
set -e

echo "[INFO] Starting n8n container..."

# Increase Node.js heap size
export NODE_OPTIONS="--max-old-space-size=1024"

# Supabase DB connection settings
DB_HOST="${DB_HOST:-aws-1-ap-south-1.pooler.supabase.com}"
DB_PORT="${DB_PORT:-6543}"

# Wait for Supabase to be reachable (retry logic)
echo "[INFO] Checking Supabase connectivity..."
for i in {1..60}; do
  if nc -z "$DB_HOST" "$DB_PORT"; then
    echo "[INFO] ✅ Database reachable. Starting n8n..."
    break
  else
    echo "[WARN] DB not reachable yet, retrying in 5s..."
    sleep 5
  fi
done

# Start n8n
exec n8n
