#!/bin/bash
# ---------------------------------------------
# @author Guillaume Seren
# source  https://github.com/GuillaumeSeren/bashrc
# file    ~/.bashrc.lig-gentoo.sh
# Licence GPLv3
#
# Preset for Nix Os
# Most of the preset are for the admin of the system
# ---------------------------------------------

# @TODO Add a check on external dependencies like sudo
# up is upgrade alias
alias up='upGrade'
alias upGrade='sudo nix-channel --update && sudo nixos-rebuild switch'
