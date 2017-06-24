#!/bin/bash
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
alias up='sudo aptitude update && sudo aptitude safe-upgrade && sudo needrestart'
alias cl='sudo aptitude remove --purge `deborphan` && sudo aptitude autoclean'
alias se='sudo aptitude search'
alias ins='sudo aptitude install'
