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
    PS1=""

    local RCol='\[\e[0m\]'

    local Red='\[\e[0;31m\]'
    local Gre='\[\e[0;32m\]'
    local BYel='\[\e[1;33m\]'
    local BBlu='\[\e[1;34m\]'
    local Pur='\[\e[0;35m\]'

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
    #PS1+="${RCol}@${BBlu}\h ${Pur}\W${BYel}$ ${RCol}"
    if [[ -n $color_prompt && $color_prompt = "yes" ]]; then
        # Color mode
        #PS1='${debian_chroot:+($debian_chroot)}\[$YELLOW\]\[$BOLD\]\u\[$BLUE\]@\[$GREEN\]\h(\[$BLUE\]\!\[$GREEN\])\[$YELLOW\]:\[$RED\]\[$BOLD\]\w\[$CYAN\] $(__git_ps1 "(%s)")\n\[$YELLOW\]\[$POWDER_BLUE\]\$\[$NORMAL\] ';
        #PS1='${debian_chroot:+($debian_chroot)}\[$YELLOW\]\u\[$BLUE\]@\[$GREEN\]\h(\[$BLUE\]\!\[$GREEN\])\[$YELLOW\]:\[$RED\]\[$BOLD\]\w\[$CYAN\] $(__git_ps1 "(%s)")\n\[$YELLOW\]\[$POWDER_BLUE\]\$\[$NORMAL\] ';
       #PS1+="${RCol}@${BBlu}\h ${Pur}\W${BYel}$ ${RCol}"
       PS1="\[$BOLD\]\[$YELLOW\]\u\[$BLUE\]@\[$GREEN\]\h\[$BLUE\](\[$RED\]$bBashStatus\[$BLUE\]|\[$RED\]\!\[$BLUE\])\[$CYAN\]:\[$GREEN\]\w\[$CYAN\] $(__git_ps1 "(%s)")\n\[$BLUE\]$ \[$NORMAL\]"
    else
        # no color mode
        GIT_PS1_SHOWDIRTYSTATE=true
        GitStatus="$(__git_ps1 "(%s)")"
        # PS1="${debian_chroot:+($debian_chroot)}\u@\h(\!):\w $GitStatus\n\$ "
        # PS1="----\u@\h($bBashStatus | \!):\w \n\$ "
        #PS1+=$bBashStatus"${RCol}@${BBlu}\h ${Pur}\W${BYel}$ ${RCol}"
        PS1="\u@\h($bBashStatus|\!):\w $(__git_ps1 "(%s)")\n $ "
    fi
}
export PROMPT_COMMAND=__prompt_command  # Func to gen PS1 after CMDs
