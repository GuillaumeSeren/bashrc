#!/usr/bin/env bash
# ---------------------------------------------
# @author Guillaume Seren
# source  https://github.com/GuillaumeSeren/bashrc
# file    ~/.bashrc.history
# Licence GPLv3
#
# History configuration file
# ---------------------------------------------

# don't put duplicate lines in the history. See bash(1) for more options
HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth
#Plus d'historique
export HISTSIZE=10000
export HISTFILESIZE=10000

# append to the history file, don't overwrite it
shopt -s histappend

# vim: set ft=sh ts=2 sw=2 tw=80 foldmethod=marker et :
