#!/bin/bash

# Use GITHUB_TOKEN if available (GitHub Actions), otherwise use SSH (CircleCI)
if [ -n "$GITHUB_TOKEN" ]; then
  REPO_URL="https://x-access-token:${GITHUB_TOKEN}@github.com/unhappychoice/blog.unhappychoice.com.git"
else
  REPO_URL="git@github.com:unhappychoice/blog.unhappychoice.com.git"
fi

# Clone the existing repository to preserve history
git clone "$REPO_URL" deploy_repo
cd deploy_repo

# Copy built files
cp -r ../build/* .
touch CNAME
echo "blog.unhappychoice.com" > CNAME

# Commit and push changes
git add .
git commit -m "chore: deployment from CI [skip ci]" || echo "No changes to deploy"
git push origin master >/dev/null 2>&1

# Cleanup
cd ..
rm -rf deploy_repo
