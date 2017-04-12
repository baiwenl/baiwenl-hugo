#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

msg="rebuilding site at $(date +'%Y-%m-%d %H:%M:%S')"
if [ $# -eq 1 ]
then
    msg="$1"
fi

#Push Hugo content
git add .
git commit -m "$msg"
git push origin master

#Build the project
#with theme,use `hugo -t <yourtheme>`
hugo --theme=hugo-multi-bootswatch 

#Push Public pages
cd public
git add .
git commit -m "$msg"
git push origin master 
cd ..

