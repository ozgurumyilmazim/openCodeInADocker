#!/usr/bin/env bash

# Start OpenCode and Cloudflare Tunnel containers using Docker Compose
# This script assumes Docker and Docker Compose are installed and the current directory
# contains the docker-compose.yml file.

# Exit on any error
set -e

# If a GitHub Container Registry token is provided, log in before pulling images
if [[ -n "${GHCR_TOKEN}" ]]; then
  echo "Logging into GHCR.io..."
  # Use the provided username or fallback to the current system user
  GHCR_USER="${GHCR_USERNAME:-$USER}"
  echo "${GHCR_TOKEN}" | docker login ghcr.io -u "${GHCR_USER}" --password-stdin
fi

# Pull the latest images (optional but recommended)
# docker compose pull

# Start the containers in detached mode
docker compose up -d

echo "OpenCode and Cloudflare Tunnel have been started."

