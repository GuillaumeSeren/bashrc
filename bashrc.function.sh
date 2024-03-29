#!/usr/bin/env bash
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
# FUNCTION GeneratePassword() {{{1
#================================================
# param: STRING $password
# param: STRING $RANDOM
# param: STRING $password_ref
#++++++++++++++++++++++++++++++++++++++++++++++++
# Description :
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Génére un mot de passe,
# si l'utilisateur n'en à pas fourni.
#################################################
function GeneratePassword()
{
    # Some help
    if [[ "$1" == "-h" ||
        "$1" == "?" ]]; then
        echo "generatePassword(): Generate Random Password from shell"
        echo "Default lenght of password is 10 and list 10"
        echo "Set your own by adding your own like generatePassword 30 50"
        bArgHelp=1
        return 1
    fi
    # The first param is lenght
    # Should be int, greater than 0
    if [[ -n "$1" &&
          "$1" != "false" &&
          "$1" =~ ^[-+]?[0-9]+$ &&
          "$1" -gt 0 ]]; then
        iPasswordLenght="${1}"
        #@TODO: We need to double check that it is a int
        #@TODO: We need the size to be >0 add the check.
    else
        # Default lenght password
        iPasswordLenght=10
        # Only alert if a value was given
        if [[ -n "$1" ]]; then
            bArgPassLenght=1
            echo "$1 is not a valid password lenght value"
            echo "Using default password lenght of: $iPasswordLenght"
        fi
    fi
    # The second param is size of the output list
    if [[ -n "$2" && \
          "$2" != "false" && \
          "$2" =~ ^[-+]?[0-9]+$ && \
          "$2" -gt 0 ]]; then
        iOutputLenght="${2}"
    else
        # Default lenght ouput
        iOutputLenght=10
        if [[ -n "$2" ]]; then
            echo "$2 is not a valid list lenght value"
            echo "Using default list lenght of: $iOutputLenght"
        fi
    fi
    for ((j=1; j <= $iOutputLenght; j++)); do
        local sPassword=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9-_!@#$%^&*()_+{}|:<>?=' | fold -w $iPasswordLenght | head -n 1 )
        echo "${sPassword}"
    done
}
# }}}
# FUNCTION PathAppend() {{{1
#================================================
# $1 param: STRING|list dir to add
#++++++++++++++++++++++++++++++++++++++++++++++++
# Description :
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Stolen from this nice answer on stackexchange.com
# https://unix.stackexchange.com/questions/124444/how-can-i-cleanly-add-to-path/480523#480523
#
# Append each passed existing directory to the current user's ${PATH} in a
# safe manner silently ignoring:
#
# * Relative directories (i.e., *NOT* prefixed by the directory separator).
# * Duplicate directories (i.e., already listed in the current ${PATH}).
# * Nonextant directories.
#################################################
function PathAppend()
{
  # For each passed dirname...
  local dirname
  for   dirname; do        # Strip the trailing directory separator if any from this dirname,
    # reducing this dirname to the canonical form expected by the
    # test for uniqueness performed below.
    dirname="${dirname%/}"

    # Alert user if dirname
    [[ ! -d "${dirname}" ]] && echo "PathAppend: Directory not exist ${dirname}"

    # If this dirname is either relative, duplicate, or nonextant, then
    # silently ignore this dirname and continue to the next. Note that the
    # extancy test is the least performant test and hence deferred.
    [[ "${dirname:0:1}" == '/' &&
      ":${PATH}:" != *":${dirname}:"* &&
      -d "${dirname}" ]] || continue

    # Else, this is an existing absolute unique dirname. In this case,
    # append this dirname to the current ${PATH}.
    PATH="${PATH}:${dirname}"
  done

  # Strip an erroneously leading delimiter from the current ${PATH} if any,    # a common edge case when the initial ${PATH} is the empty string.
  PATH="${PATH#:}"

  # Export the current ${PATH} to subprocesses. Although system-wide scripts
  # already export the ${PATH} by default on most systems, "Bother free is
  # the way to be."
  export PATH
}
# FUNCTION PathPrepend() {{{1
#================================================
# $1 param: STRING|list dir to add
#++++++++++++++++++++++++++++++++++++++++++++++++
# Description :
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Stolen from this nice answer on stackexchange.com
# https://unix.stackexchange.com/questions/124444/how-can-i-cleanly-add-to-path/480523#480523
#
# Prepend each passed existing directory to the current user's ${PATH} in a
# safe manner silently ignoring:
#
# * Relative directories (i.e., *NOT* prefixed by the directory separator).
# * Duplicate directories (i.e., already listed in the current ${PATH}).
# * Nonextant directories.
#################################################
function PathPrepend()
{
    local dirname
    for dirname in "${@}"; do
      dirname="${dirname%/}"

      # Alert user if dirname
      [[ ! -d "${dirname}" ]] && echo "PathPrepend: Directory not exist ${dirname}"

      [[ "${dirname:0:1}" == '/' &&
          ":${PATH}:" != *":${dirname}:"* &&
          -d "${dirname}" ]] || continue

      PATH="${dirname}:${PATH}"
    done

    PATH="${PATH%:}"
    export PATH
}
# vim: set ft=sh ts=2 sw=2 tw=80 foldmethod=marker et :
