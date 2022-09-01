#!/bin/bash

echo Creating new project...

#Checking remote url
REMOTE_URL=$(git config --get remote.origin.url)
DEFAULT_REMOTE_URL=https://github.com/CeSiumUA/STM32-M4-NO-IDE.git
echo "${REMOTE_URL}"

if [ $REMOTE_URL=$DEFAULT_REMOTE_URL ]
then
    echo Recreating git repository...
    git init
    echo "Enter new repository url (blank if none):"
    read url
    if [ $url="" ]
    then
        echo "No url added"
    else
        git remote add origin $url
    fi
else
    echo Repository was already unsticked from default origin
fi

echo "Enter new project name:"
read new_project_name
cp --recursive GPIO $new_project_name

echo "Done :)"
