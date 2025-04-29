#!/bin/bash

# IMPORTANT: type your GitHub username inside
# the quotes, or this script will fail

USERNAME=""

# Double-check
if [[ $# -eq 0 ]]; then
    echo "Need message!"
    exit 1
fi

# Double-check
if [[ -z "$USERNAME" ]]; then
    echo "Need username!"
    exit 1
fi

# Double-check
if [[ ! -d codelabs ]]; then
    echo 'Check path!'
    exit 1
fi

# Check for "bind" mount-point (see below)
if [[ -d dist ]]; then
    cd dist || exit
    # If codelabs exists AND is a directory
    if [[ -d codelabs ]]; then
        CODELABS=$(pwd)
        # Double-check
        if [[ -d "$CODELABS/codelabs/assets" ]]; then
            sudo umount "$CODELABS/codelabs"
        fi
    fi
    cd ..
fi

# TODO
#exit 0

if ! gulp dist --codelabs-dir=codelabs
then
    echo 'No dice!'
    exit 1
fi

cd dist || exit
# if the "soft link" codelabs exists
if [[ -L codelabs ]]; then
    # remove the codelabs "soft link"
    rm codelabs
    # replace with an actual directory
    mkdir codelabs
    # refer "Troubleshooting" section
    #touch .nojekyll
    # copy your custom ReadMe file
    cp ../README.md ./
fi

# Bind: remount part of the file hierarchy somewhere else.
# In our case, mount our ACTUAL "codelabs" folder
# to the directory/mount-point created just above
sudo mount --bind ../codelabs codelabs

# TODO
#exit 0

# These are our regular git commands, EXCEPT the lengthy output
# from "git commit" is redirected to a file called "commit.txt"
COMMIT="commit.txt"
git init
git add .
git commit -m "$1" > $COMMIT
git branch -M master
git remote add origin "https://github.com/$USERNAME/$USERNAME.github.io.git"

# Just show the first TWO lines of the "git commit" output
head -n 2 $COMMIT
# Confirmation, reminding that there's still ONE step to go.
# It's done this way so that you have a chance to catch your
# breath, before actually committing to any big changes =)
echo 'Done ... just need to "git push -f origin master"'
