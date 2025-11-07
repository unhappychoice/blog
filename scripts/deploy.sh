#!/bin/bash

set -e

# Setup git authentication
if [ -n "$GITHUB_TOKEN" ]; then
  # Use GITHUB_TOKEN for GitHub Actions
  REPO_URL="https://github.com/unhappychoice/blog.unhappychoice.com.git"

  # Configure git to use token without exposing it in URLs
  git config --global url."https://x-access-token:${GITHUB_TOKEN}@github.com/".insteadOf "https://github.com/"
else
  # Use SSH for CircleCI
  REPO_URL="git@github.com:unhappychoice/blog.unhappychoice.com.git"
fi

# Clone the existing repository to preserve history
git clone --quiet "$REPO_URL" deploy_repo 2>&1 | grep -v "x-access-token" || true
cd deploy_repo

# Copy built files
cp -r ../build/* .
touch CNAME
echo "blog.unhappychoice.com" > CNAME

# Commit and push changes
git add .
if git commit -m "chore: deployment from CI [skip ci]" >/dev/null 2>&1; then
  git push --quiet origin master 2>&1 | grep -v "x-access-token" || true
  echo "Deployment completed successfully"
else
  echo "No changes to deploy"
fi

# Cleanup
cd ..
rm -rf deploy_repo

# Cleanup git config
if [ -n "$GITHUB_TOKEN" ]; then
  git config --global --unset url."https://x-access-token:${GITHUB_TOKEN}@github.com/".insteadOf || true
fi
