# ---------------------------------------------
# @author Guillaume Seren
# source  https://github.com/GuillaumeSeren/bashrc
# file    ~/.bashrc.prompt
# Licence GPLv3
#
# prompt definition file
# ---------------------------------------------

function __prompt_command() {
    local EXIT="$?"             # This needs to be first

    if [ $EXIT != 0 ]; then
        bBashStatus="KO"
        #PS1+="${Red}\u${RCol}"      # Add red if exit code non 0
    else
        bBashStatus="OK"
        #PS1+="${Gre}\u${RCol}"
    fi

    # set variable identifying the chroot you work in (used in the prompt below)
    if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
        debian_chroot=$(cat /etc/debian_chroot)
    fi

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

    # Define color for keep the PS1 clean :
    BLACK=$(tput setaf 0)
    RED=$(tput setaf 1)
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

    #@TODO: Check git istall in the system
    GIT_PS1_SHOWDIRTYSTATE=true
    if [[ -n $color_prompt && $color_prompt = "yes" ]]; then
        # Color mode
        PS1="\[$BLUE\](\[$RED\]$bBashStatus\[$BLUE\]|\[$RED\]\!\[$BLUE\])\[$GREEN\]\u\[$BLUE\]@\[$GREEN\]\h\[$BLUE\]:\[$GREEN\]\w\[$BLUE\] $(__git_ps1 "(%s)")\n\[$BLUE\]$ \[$NORMAL\]"
    else
        # no color mode
        PS1="($bBashStatus|\!)\u@\h:\w $(__git_ps1 "(%s)")\n $ "
    fi
}
export PROMPT_COMMAND=__prompt_command  # Func to gen PS1 after CMDs
