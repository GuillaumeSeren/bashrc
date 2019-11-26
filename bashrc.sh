#!/bin/bash
# ---------------------------------------------
# @author Guillaume Seren
# source  https://github.com/GuillaumeSeren/bashrc
# file    ~/.bashrc
# Licence GPLv3
#
# Global Bash/Dash configuration file
# This bashrc configuration is broken into small files.
# ---------------------------------------------

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# First resolve the bashrc link
BASH_REAL_PATH="$(dirname "$(readlink -f ~/.bashrc)")"
USER_REAL_PATH="$BASH_REAL_PATH/user.d"

# source set file
[ -f "$BASH_REAL_PATH"/bashrc.set.sh ]        && source "$BASH_REAL_PATH"/bashrc.set.sh
# source aliases file
[ -f "$BASH_REAL_PATH"/bashrc.alias.sh ]      && source "$BASH_REAL_PATH"/bashrc.alias.sh
# source history file
[ -f "$BASH_REAL_PATH"/bashrc.history.sh ]    && source "$BASH_REAL_PATH"/bashrc.history.sh
# source prompt file
[ -f "$BASH_REAL_PATH"/bashrc.prompt.sh ]     && source "$BASH_REAL_PATH"/bashrc.prompt.sh
# source function file
[ -f "$BASH_REAL_PATH"/bashrc.function.sh ]   && source "$BASH_REAL_PATH"/bashrc.function.sh
# Add user config if defined
[ -f "$USER_REAL_PATH"/bashrc.local-user.sh ] && source "$USER_REAL_PATH"/bashrc.local-user.sh
