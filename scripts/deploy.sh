#!/bin/bash

cd build
git init
git remote add origin https://unhappychoice:${GITHUB_PASSWORD}@github.com/unhappychoice/unhappychoice.github.io.git
git add .
git commit -m 'Deployment from CircleCI'
git push origin master -f
