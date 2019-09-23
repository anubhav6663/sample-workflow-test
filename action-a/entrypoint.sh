#!/bin/sh -l

# branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
# bname=$(echo $branch | awk '{n=split($0,a); print a[n]}') 
# branch=$(echo $bname | awk '{split($0,b,")");print b[1]}')
# echo $branch
commitID=$(git log --format="%H" -n 1)
echo $commitID
git checkout master 
git cherry-pick $commitID
#git push origin master