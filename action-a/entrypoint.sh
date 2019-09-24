#!/bin/sh -l
branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
bname=$(echo $branch | awk '{n=split($0,a); print a[n]}') 
branch=$(echo $bname | awk '{split($0,b,")");print b[1]}')
echo $branch
git checkout master
git log --format="%H" -n 1
git checkout $branch
commitID=$(git log --format="%H" -n 1)
echo $commitID
git checkout -b dev_test $branch 
git remote add origin https://github.com/mugdha-adhav/sample-workflow-test
git config gc.auto 0
git config --get-all http.https://github.com/mugdha-adhav/sample-workflow-test.extraheader
git config --get-all http.proxy
git -c http.extraheader="AUTHORIZATION: basic ***" push origin dev_test

git log --format="%H" -n 10
git config user.name