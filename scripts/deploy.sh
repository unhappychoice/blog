#!/bin/bash

set -e

REPO_URL="git@github.com:unhappychoice/blog.unhappychoice.com.git"

# Clone the existing repository to preserve history
git clone "$REPO_URL" deploy_repo
cd deploy_repo

# Copy built files
cp -r ../build/* .
touch CNAME
echo "blog.unhappychoice.com" > CNAME

# Commit and push changes
git add .
if git commit -m "chore: deployment from CI [skip ci]"; then
  git push origin master
  echo "Deployment completed successfully"
else
  echo "No changes to deploy"
fi

# Cleanup
cd ..
rm -rf deploy_repo
