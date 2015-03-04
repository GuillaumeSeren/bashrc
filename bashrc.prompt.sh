# ---------------------------------------------
# @author Guillaume Seren
# source  https://github.com/GuillaumeSeren/bashrc
# file    ~/.bashrc.prompt
# Licence GPLv3
#
# prompt definition file
# ---------------------------------------------

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Comment that to turn off color prompt
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
BLACK=       $(tput setaf 0)
RED=         $(tput setaf 1)
GREEN=       $(tput setaf 2)
LIME_YELLOW= $(tput setaf 190)
YELLOW=      $(tput setaf 3)
POWDER_BLUE= $(tput setaf 153)
BLUE=        $(tput setaf 4)
MAGENTA=     $(tput setaf 5)
CYAN=        $(tput setaf 6)
WHITE=       $(tput setaf 7)
BRIGHT=      $(tput bold)
NORMAL=      $(tput sgr0)
BLINK=       $(tput blink)
REVERSE=     $(tput smso)
BOLD=        $(tput bold)
UNDERLINE=   $(tput smul)

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[$YELLOW\]\[$BOLD\]\u\[$BLUE\]@\[$GREEN\]\h(\[$BLUE\]\!\[$GREEN\])\[$YELLOW\]:\[$RED\]\[$BOLD\]\w\[$CYAN\]\n\[$YELLOW\]\$ \[$NORMAL\]';
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
    screen)
        # Set screen window title
        PROMPT_COMMAND='echo -ne "\033k$HOSTNAME\033\\"'
        ;;
    *)
        ;;
esac
