#!/usr/bin/env bash
# ---------------------------------------------
# @author Guillaume Seren
# source  https://github.com/GuillaumeSeren/bashrc
# file    ~/.bashrc.prompt
# Licence GPLv3
#
# prompt definition file
# ---------------------------------------------

function timer_now {
    date +%s
}

function timer_start {
    timer_start=${timer_start:-$(timer_now)}
}

function timer_stop {
    local delta_sec=$((($(timer_now) - $timer_start)))
    # inspirations:
    # https://stackoverflow.com/questions/1862510/how-can-the-last-commands-wall-time-be-put-in-the-bash-prompt#1862762
    # https://github.com/popstas/zsh-command-time
    # https://github.com/Powerlevel9k/powerlevel9k/pull/402/files
    # https://stackoverflow.com/questions/12199631/convert-seconds-to-hours-minutes-seconds
    # @TODO Extract minimal duration as a param
    if ((delta_sec > 0)); then
      # @TODO Maybe we switch iso8601 duration (https://en.wikipedia.org/wiki/ISO_8601#Durations)
      timer_show="\nExecution time was: $(TZ=GMT; date '+%Hh:%Mm:%Ss' -u -d @$delta_sec )\n"
    fi
    unset timer_start
}

# function __prompt_command() {{{1
function __prompt_command() {
    # This needs to be first
    local EXIT="$?"

    # uncomment for a colored prompt, if the terminal has the capability; turned
    # off by default to not distract the user: the focus in a terminal window
    # should be on the output of commands, not on the prompt
    force_color_prompt=yes
    if [ -n "$force_color_prompt" ]; then
        if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
            # We have color support; assume it's compliant with Ecma-48
            # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
            # a case would tend to support setf rather than setaf.)
            color_prompt=yes
        else
            color_prompt=
        fi
    fi

    # Only define color if needed, provide free colorless mode.
    if [[ -n $color_prompt && $color_prompt == "yes" ]]; then
        # Define color for keep the PS1 clean :
        BLACK=$(tput setaf 0)
        # Error color
        RED=$(tput setaf 1)
        # Ok color
        GREEN=$(tput setaf 2)
        YELLOW=$(tput setaf 3)
        LIME_YELLOW=$(tput setaf 190)
        BLUE=$(tput setaf 4)
        POWDER_BLUE=$(tput setaf 153)
        MAGENTA=$(tput setaf 5)
        CYAN=$(tput setaf 6)
        WHITE=$(tput setaf 7)
        BRIGHT=$(tput bold)
        NORMAL=$(tput sgr0)
        BLINK=$(tput blink)
        REVERSE=$(tput smso)
        BOLD=$(tput bold)
        UNDERLINE=$(tput smul)
    fi

    # Check the last error code status
    if [ $EXIT != 0 ]; then
        colorError="\[$RED\]"
        bashStatus="${colorError}KO $EXIT"
        bashNumber="${colorError}\!"
    else
        colorSuccess="\[$GREEN\]"
        bashStatus="${colorSuccess}OK $EXIT"
        bashNumber="${colorSuccess}\!"
    fi

    if [ -n "$(type -t __git_ps1)" ]; then
        # Detect git status
        GIT_PS1_SHOWDIRTYSTATE=true
        gitStatus="\[$GREEN\]"$(__git_ps1 "(%s)")
    else
        # If the function is not defined (yet) you can load it in the
        # bashrc.local-user.sh and recall the function __prompt_command()
        gitStatus=''
    fi

    timer_stop
    # Prompt
    PS1="${timer_show}\[$BLUE\](\[$NORMAL\]${bashStatus}\[$BLUE\]|${bashNumber}\[$BLUE\])\[$YELLOW\]\u\[$BLUE\]@\[$YELLOW\]\h\[$BLUE\]:\[$YELLOW\]\w $gitStatus\[$BLUE\]\n$ \[$NORMAL\]"

    # Echo the hostname, for screen/tmux
    echo -ne "\033k$HOSTNAME\033\\"
}
# }}}
trap 'timer_start' DEBUG
# Function to gen PS1 after CMDs
export PROMPT_COMMAND=__prompt_command

# vim: set ft=sh ts=2 sw=2 tw=80 foldmethod=marker et :
