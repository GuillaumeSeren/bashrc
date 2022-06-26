#!/usr/bin/env bash
# ---------------------------------------------
# @author Guillaume Seren
# source  https://github.com/GuillaumeSeren/bashrc
# file    ~/.bashrc.lig-gentoo.sh
# Licence GPLv3
#
# Preset for Gentoo Os
# Most of the preset are for the admin of the system
# ---------------------------------------------

# @TODO Add a check on external dependencies like sudo, needrestart
# up is upgrade alias
alias upDate='sudo emerge --sync'
alias upGrade='sudo emerge --ask --verbose --update --deep --changed-use @world && sudo emerge @preserved-rebuild'
alias upClean='sudo emerge --depclean && sudo eclean-dist -d && sudo eclean-pkg -d'
alias upRestart='sudo needrestart'
alias up="upDate && upGrade && upClean && upRestart"
