#!/usr/bin/env bash

# Start OpenCode and Cloudflare Tunnel containers using Docker Compose
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

# Clone the target repository (if configured)
if [[ -n "${GIT_REPO_URL}" && -n "${REPO_DIR}" ]]; then
  if [ -d "${REPO_DIR}" ]; then
    echo "Repository directory \"${REPO_DIR}\" already exists. Updating..."
    (cd "${REPO_DIR}" && git pull || echo "Git pull failed, continuing...")
  else
    echo "Cloning repository ${GIT_REPO_URL} into ${REPO_DIR}..."
    git clone "${GIT_REPO_URL}" "${REPO_DIR}" || echo "Git clone failed, continuing..."
  fi
fi

# If a GitHub Container Registry token is provided, log in before pulling images
if [[ -n "${GHCR_TOKEN}" ]]; then
  echo "Logging into GHCR.io..."
  GHCR_USER="${GHCR_USERNAME:-$USER}"
  echo "${GHCR_TOKEN}" | docker login ghcr.io -u "${GHCR_USER}" --password-stdin
fi

# Pull the latest images (optional but recommended)
# docker compose pull

# Start the containers in detached mode
docker compose up -d

echo "OpenCode and Cloudflare Tunnel have been started."

