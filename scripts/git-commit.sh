#!/usr/bin/env bash

# Load environment variables (needed for REPO_DIR)
if [ -f .env ]; then
  set -a
  source .env
  set +a
fi

# Default repository directory if not set
REPO_DIR=${REPO_DIR:-repo}

# Commit message can be passed as the first argument; fallback to a default message
COMMIT_MSG=${1:-"Automated commit $(date '+%Y-%m-%d %H:%M:%S')"}

if [ -d "$REPO_DIR" ]; then
  echo "Committing changes in $REPO_DIR with message: $COMMIT_MSG"
  (cd "$REPO_DIR" && git add . && git commit -m "$COMMIT_MSG") || echo "git commit failed (maybe nothing to commit)"
else
  echo "Repository directory $REPO_DIR does not exist. Cannot commit."
fi

