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
[ -z "$PS1" ] && return

BASHRCD=$HOME"/.bashrc.d"
# include set file
source $BASHRCD/.bashrc.set.sh
# include aliases file
source $BASHRCD/.bashrc.alias.sh
# include history file
source $BASHRCD/.bashrc.history.sh
# include prompt file
source $BASHRCD/.bashrc.prompt.sh
# include function file
source $BASHRCD/.bashrc.function.sh
