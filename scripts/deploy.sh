#!/bin/bash

cd build
touch CNAME
echo "blog.unhappychoice.com" >> CNAME
git init
git remote add origin https://unhappychoice:${GITHUB_PASSWORD}@github.com/unhappychoice/unhappychoice.github.io.git
git add .
git commit -m 'Deployment from CircleCI'
git push origin master -f >/dev/null 2>&1
