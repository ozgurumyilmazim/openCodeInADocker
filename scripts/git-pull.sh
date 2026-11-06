#!/usr/bin/env bash

# Load environment variables (needed for REPO_DIR)
if [ -f .env ]; then
  set -a
  source .env
  set +a
fi

# Default repository directory if not set
REPO_DIR=${REPO_DIR:-repo}

if [ -d "$REPO_DIR" ]; then
  echo "Pulling latest changes in $REPO_DIR..."
  (cd "$REPO_DIR" && git pull) || echo "git pull failed"
else
  echo "Repository directory $REPO_DIR does not exist. Cannot pull."
fi

