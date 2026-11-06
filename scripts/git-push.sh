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
  echo "Pushing commits from $REPO_DIR..."
  (cd "$REPO_DIR" && git push) || echo "git push failed"
else
  echo "Repository directory $REPO_DIR does not exist. Cannot push."
fi

