#!/usr/bin/env bash

# Start OpenCode and Cloudflare Tunnel containers using Docker Compose
# This script assumes Docker and Docker Compose are installed and the current directory
# contains the docker-compose.yml file.

# Exit on any error
set -e

# Pull the latest images (optional but recommended)
# docker compose pull

# Start the containers in detached mode
docker compose up -d

echo "OpenCode and Cloudflare Tunnel have been started."

