#!/bin/bash

# Clone the existing repository to preserve history
git clone git@github.com:unhappychoice/blog.unhappychoice.com.git deploy_repo
cd deploy_repo

# Copy built files
cp -r ../build/* .
touch CNAME
echo "blog.unhappychoice.com" > CNAME

# Commit and push changes
git add .
git commit -m "chore: deployment from CircleCI [skip ci]" || echo "No changes to deploy"
git push origin master >/dev/null 2>&1

# Cleanup
cd ..
rm -rf deploy_repo
