#!/bin/bash
cd ~/built_site
echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"
cd ~/sourajitk.github.io
hugo -d ~/Project-Stuff/compiled-blog

# Go To Public folder
cd ~/Project-Stuff/compiled-blog

# Add changes to git.
git add .

# Commit changes.
git commit -m "[WebsiteCI]: Push Built Site"

# Push source and build repos.
git push ssh://git@github.com/sourajitk/sourajitk.github.io.git HEAD:refs/heads/master