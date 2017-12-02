#!/bin/bash

cd build
touch CNAME
echo "blog.unhappychoice.com" >> CNAME
git init
git remote add origin git@github.com:unhappychoice/unhappychoice.github.io.git
git add .
git commit -m 'Deployment from CircleCI'
git push origin master -f >/dev/null 2>&1
