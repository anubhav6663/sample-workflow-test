#!/bin/bash
#temp branch created by actions
branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
bname=$(echo $branch | awk '{n=split($0,a); print a[n]}') 
branch=$(echo $bname | awk '{split($0,b,")");print b[1]}')

#Find PR number from $branch
pr_id=$(echo $branch | awk '{split($0,a,"/");print a[2]}')

#set new branch name
new_branch="test/$pr_id"

#check if new branch already exists
git checkout master
branch_list=`git branch`
if_exists=$(echo $branch_list | grep $new_branch) 
if [ "$if_exists" != "" ]; then 
    echo "Deleting branch"
    git branch -D $new_branch
    
fi

git checkout $branch
git checkout -b $new_branch $branch 
git push -f https://${USER_NAME}:${PASSWORD}@github.com/mugdha-adhav/sample-workflow-test.git
echo ${MY_NAME}