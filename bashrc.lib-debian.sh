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

# @TODO Add a check on external dependencies like sudo, needrestart
# up is upgrade alias
alias upDate='sudo apt update'
alias upGrade='sudo apt upgrade && sudo apt dist-upgrade'
alias upClean='sudo apt autoremove && sudo apt clean'
alias upRestart='sudo needrestart'
alias up="upDate && upGrade && upClean && upRestart"
