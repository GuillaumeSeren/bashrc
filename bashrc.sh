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

# include set file
source $HOME/.bashrc.set.sh
# include aliases file
source $HOME/.bashrc.alias.sh
# include history file
source $HOME/.bashrc.history.sh
# include prompt file
source $HOME/.bashrc.prompt.sh
# include function file
source $HOME/.bashrc.function.sh
