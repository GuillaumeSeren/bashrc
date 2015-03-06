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

# First resolve the bashrc link
BASH_REAL_PATH=$(dirname $(realpath ~/.bashrc))

# include set file
source $BASH_REAL_PATH/bashrc.set.sh
# include aliases file
source $BASH_REAL_PATH/bashrc.alias.sh
# include history file
source $BASH_REAL_PATH/bashrc.history.sh
# include prompt file
source $BASH_REAL_PATH/bashrc.prompt.sh
# include function file
source $BASH_REAL_PATH/bashrc.function.sh
