#!/bin/bash
# Source the lib-gentoo
[ -f "$BASH_REAL_PATH"/bashrc.lib-nixos.sh ] && source "$BASH_REAL_PATH"/bashrc.lib-nixos.sh

# Define an awesome alias
alias hello="echo hello from my user alias"

# user fzf module
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
