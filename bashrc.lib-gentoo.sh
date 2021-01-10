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

# @TODO Add a check on external dependencies like sudo
# up is upgrade alias
alias up='sudo emerge --sync && sudo emerge --ask --verbose --update --deep --changed-use @world && sudo emerge @preserved-rebuild && sudo emerge --depclean && sudo needrestart'
