#!/usr/bin/env bash
# ---------------------------------------------
# @author Guillaume Seren
# source  https://github.com/GuillaumeSeren/bashrc
# file    ~/.bashrc.lib-debian.sh
# Licence GPLv3
#
# Preset for Debian Os
# Most of the preset are for the admin of the system
# ---------------------------------------------

# @FIXME Check if checkrestart is available before using it
alias up='sudo apt update && sudo apt upgrade && sudo needrestart'
