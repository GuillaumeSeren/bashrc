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
source $PWD/.bashrc.set.sh
# include aliases file
source $PWD/.bashrc.alias.sh
# include history file
source $PWD/.bashrc.history.sh
# include prompt file
source $PWD/.bashrc.prompt.sh
# include function file
source $PWD/.bashrc.function.sh
