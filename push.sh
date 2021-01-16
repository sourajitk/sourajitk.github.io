#!/bin/bash
cd ~/public
git remote rm origin
git remote add origin https://sourajitk:${GH_PERSONAL_TOKEN}@github.com/sourajitk/sourajitk.github.io

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"
cd ~/app
hugo -d ~/public

# Go To Public folder
cd ~/public

# Add changes to git.
git add .

# Commit changes.
git commit -m "[WebsiteCI]: Push Built Site"

# Push source and build repos.
git push ssh://git@github.com/sourajitk/sourajitk.github.io.git HEAD:refs/heads/master
