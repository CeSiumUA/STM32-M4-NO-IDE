#!/bin/bash

echo Creating new project...

#Checking remote url
REMOTE_URL=$(git config --get remote.origin.url)
DEFAULT_REMOTE_URL=https://github.com/CeSiumUA/STM32-M4-NO-IDE.git
echo "${REMOTE_URL}"

if [ "$REMOTE_URL" = "$DEFAULT_REMOTE_URL" ]
then
    echo Recreating git repository...
    rm -rf .git
    git init
    echo "Enter new repository url (blank if none):"
    read url
    git remote add origin $url
else
    echo Repository was already unsticked from default origin
fi

echo "Enter new project name:"
read new_project_name

echo "Enter project to copy from:"
read copy_from

if [ "$copy_from" = "" ]
then
    cp --recursive GPIO $new_project_name
else
    cp --recursive $copy_from $new_project_name
fi

echo "Remove source folder? (y - remove, anything else - ignore)"
read remove_decision

if [ "$remove_decision" = "y" ]
then
    rm -rf $copy_from
else
    echo ""
fi

echo "Done :)"
