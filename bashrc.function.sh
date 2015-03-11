#!/bin/bash
# ---------------------------------------------
# @author Guillaume Seren
# source  https://github.com/GuillaumeSeren/bashrc
# file    ~/.bashrc.function
# Licence GPLv3
#
# Bash Function definition file
# ---------------------------------------------

# repeat n times command
function Repeat() {
    local i max
    max=$1; shift;
    for ((i=1; i <= max ; i++)); do
        eval "$@";
    done
}

# Unpack the file given in arg
function Extract() {
    local FILENAME="${1}"
    local FILEEXTENSION=`echo ${1} | cut -d. -f2-`
    case "$FILEEXTENSION" in
        tar)
            tar xvf "$FILENAME";;
        tar.gz)
            tar xzvf "$FILENAME";;
        tgz)
            tar xzvf "$FILENAME";;
        gz)
            gunzip "$FILENAME";;
        tbz)
            tar xjvf "$FILENAME";;
        tbz2)
            tar xjvf "$FILENAME";;
        tar.bz2)
            tar xjvf "$FILENAME";;
        tar.bz)
            tar xjvf "$FILENAME";;
        bz2)
            bunzip2 "$FILENAME";;
        tar.Z)
            tar xZvf "$FILENAME";;
        Z)
            uncompress "$FILENAME";;
        zip)
            unzip "$FILENAME";;
        rar)
            unrar x "$FILENAME";;
    esac
}

# Bash update
#@TODO: we need a silent call to be called by upgrade
function BashUpdate() {
    echo "-> Update Bash from git"
    # move to the right place
    cd $BASH_REAL_PATH
    # Return the last local sha1
    BASH_PROFILE_VERSION=$(git rev-parse HEAD)
    echo "bashConfig is :$BASH_PROFILE_VERSION"
    git fetch origin
    BASH_CONFIG_HEAD_HASH=$(git log HEAD..origin/master --oneline)
    if [[ "${BASH_CONFIG_HEAD_HASH}" != "" ]];then
        # You are NOT up to date
        echo "You are NOT up-to-date"
        echo "Upgrade your config, type: bashUpgrade"
    else
        # You got the latest version
        echo "You are up-to-date ;)"
    fi
}

function BashUpgrade() {
    echo "Upgrading your BashConfig"
    # move to the right place
    cd $BASH_REAL_PATH
    git pull origin master
}
