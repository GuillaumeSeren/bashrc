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
# Refresh the git repo for news
function BashUpdate() {
    if [[ -n "$1" && "$1" != "false" && "$1" == "1" ]]; then
        # it is a silent call
        #echo "stay silent"
        #exit 1
        BASH_CONFIG_FETCH_SILENT="$1"
    fi
    # it is a direct call
    # BASH_CONFIG_UPTODATE="0"
    if [[ -z "$BASH_CONFIG_FETCH_SILENT" &&
          "$BASH_CONFIG_FETCH_SILENT" != "1" ]]; then
        echo "-> Update Bash from git"
    fi
    # move to the right place
    cd $BASH_REAL_PATH
    # Return the last local sha1
    BASH_PROFILE_VERSION=$(git rev-parse HEAD)
    if [[ -z "$BASH_CONFIG_FETCH_SILENT" &&
          "$BASH_CONFIG_FETCH_SILENT" != "1" ]]; then
        echo "bashConfig is :$BASH_PROFILE_VERSION"
    fi

    git fetch origin -q
    BASH_CONFIG_FETCH_STATUS="$?"

    if [[ -z "$BASH_CONFIG_FETCH_SILENT" &&
          "$BASH_CONFIG_FETCH_SILENT" != "1" ]]; then
        BashUpgradeNeeded
    else
        echo "$BASH_CONFIG_FETCH_STATUS"
    fi
}

# Check if you need/should upgrade
function BashUpgradeNeeded() {
    if [[ -n "$1" && "$1" != "false" && "$1" == "1" ]]; then
        # it is a silent call
        #echo "stay silent"
        #exit 1
        BASH_CONFIG_FETCH_SILENT="$1"
    fi
    # move to the right place
    cd $BASH_REAL_PATH
    BASH_CONFIG_HEAD_HASH=$(git log HEAD..origin/master --oneline)
    if [[ "${BASH_CONFIG_HEAD_HASH}" != "" ]];then
        # You are NOT up to date
        if [[ -z "$BASH_CONFIG_FETCH_SILENT" &&
              "$BASH_CONFIG_FETCH_SILENT" != "1" ]]; then
            echo "You are NOT up-to-date"
            echo "Upgrade your config, type: bashUpgrade"
        else
            echo "1"
            #echo $BASH_CONFIG_FETCH_STATUS
        fi
    else
        # You got the latest version
        if [[ -z "$BASH_CONFIG_FETCH_SILENT" &&
              "$BASH_CONFIG_FETCH_SILENT" != "1" ]]; then
            echo "You are up-to-date ;)"
        else
            echo "0"
            #echo $BASH_CONFIG_FETCH_STATUS
        fi
    fi
}

# Upgrade your BashConfig
function BashUpgrade() {
    # we first fetch origin
    BASH_CONFIG_FETCHED=$(BashUpdate "1")
    BASH_CONFIG_UPDATE_NEEDED=$(BashUpgradeNeeded "1")
    if [[ -n $BASH_CONFIG_FETCHED &&
          $BASH_CONFIG_UPDATE_NEEDED == "1" ]]; then
        #@TODO: Add a function to count upgrade before doing it
        echo "Upgrading your BashConfig"
        # move to the right place
        cd $BASH_REAL_PATH
        git pull origin master
        # Reload !
        bash ~/.bashrc
    else
        echo "No upgrade available"
    fi
}
