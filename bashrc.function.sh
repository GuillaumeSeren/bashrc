#!/bin/bash
# ---------------------------------------------
# @author Guillaume Seren
# source  https://github.com/GuillaumeSeren/bashrc
# file    ~/.bashrc.function
# Licence GPLv3
#
# Bash Function definition file
# ---------------------------------------------

# FUNCTION Repeat() {{{1
# repeat n times command
function Repeat() {
    local i max
    max=$1; shift;
    for ((i=1; i <= max ; i++)); do
        eval "$@";
    done
}

# FUNCTION BashUpdate() {{{1
# Refresh the git repo for news
function BashUpdate() {
    if [[ -n "$1" && "$1" != "false" && "$1" == "1" ]]; then
        # it is a silent call
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

# FUNCTION BashUpgradeNeeded() {{{1
# Check if you need/should upgrade
function BashUpgradeNeeded() {
    if [[ -n "$1" && "$1" != "false" && "$1" == "1" ]]; then
        # it is a silent call
        BASH_CONFIG_FETCH_SILENT="$1"
    fi
    # move to the right place
    cd "${BASH_REAL_PATH}" || exit
    BASH_CONFIG_HEAD_HASH=$(git log HEAD..origin/master --oneline)
    if [[ "${BASH_CONFIG_HEAD_HASH}" != "" ]];then
        # You are NOT up to date
        if [[ -z "$BASH_CONFIG_FETCH_SILENT" &&
              "$BASH_CONFIG_FETCH_SILENT" != "1" ]]; then
            echo "You are NOT up-to-date"
            echo "Upgrade your config, type: bashUpgrade"
        else
            echo "1"
        fi
    else
        # You got the latest version
        if [[ -z "$BASH_CONFIG_FETCH_SILENT" &&
              "$BASH_CONFIG_FETCH_SILENT" != "1" ]]; then
            echo "You are up-to-date ;)"
        else
            echo "0"
        fi
    fi
}

# FUNCTION BashUpgrade() {{{1
# Upgrade your BashConfig
function BashUpgrade() {
    # we first fetch origin
    BASH_CONFIG_FETCHED="$(BashUpdate "1")"
    BASH_CONFIG_UPDATE_NEEDED="$(BashUpgradeNeeded "1")"
    if [[ -n $BASH_CONFIG_FETCHED &&
          $BASH_CONFIG_UPDATE_NEEDED == "1" ]]; then
        #@TODO: Add a function to count upgrade before doing it
        echo "Upgrading your BashConfig"
        # move to the right place
        cd "${BASH_REAL_PATH}" || exit
        git pull origin master
        # Reload !
        echo "Reloading Bash configuration"
        bash ~/.bashrc
        # Roll back to previous location
        cd - || exit
    else
        echo "No upgrade available"
    fi
}
