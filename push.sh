add() {
    git add .
    echo "Enter your commit message: "
    read message
    git commit -m "$message"
    
    if [[ -z "$message" ]]; then
        echo "\e[31mError: you must enter a commit message\e[39m\n"
        add
    fi
}

git add .
echo "Enter your commit message: "
read message
git commit -m "$message"

if [[ -z "$message" ]]; then
    echo "\e[31mError: you must enter a commit message\e[39m\n"
    add
fi

echo "Source: "
read source

#user doesn't specify remote
if [[ -z "$source" ]]; then
    #promt user for branch
    echo "Branch: "
    read branch
    #user doesn't specify branch
    if [[ -z "$branch" ]]; then
        #pushing to default settings
        git push origin master
    else
        echo "git push origin $branch"
    fi
#source
else
   echo "Branch: "
   read branch2
   #user dosen't input branch but has inputted a remote
   if [[ -z "$branch2" ]]; then
        echo "git push $source master"
   else
        echo "git push $source $branch2"
   fi
fi
 