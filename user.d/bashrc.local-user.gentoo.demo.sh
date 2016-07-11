# Source the lib-gentoo
[ -f "$BASH_REAL_PATH"/bashrc.lib-gentoo.sh ] && source "$BASH_REAL_PATH"/bashrc.lib-gentoo.sh

# Define an awesome alias
alias hello="echo hello from my user alias"

# Sourcethe git_prompt
[ -f /usr/share/git/git-prompt.sh ] && source /usr/share/git/git-prompt.sh
# Refresh the prompt
export PROMPT_COMMAND=__prompt_command

# user fzf module
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
