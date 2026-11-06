#!/usr/bin/env bash

# Stop OpenCode and Cloudflare Tunnel containers using Docker Compose
# This script assumes Docker and Docker Compose are installed and the current directory
# contains the docker-compose.yml file.

# Exit on any error
set -e

# Load environment variables (needed for REPO_DIR)
if [ -f .env ]; then
  set -a
  source .env
  set +a
fi

# Stop and remove containers, networks, volumes defined in the compose file
docker compose down

echo "OpenCode and Cloudflare Tunnel have been stopped."

