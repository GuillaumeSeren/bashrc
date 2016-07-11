# ---------------------------------------------
# @author Guillaume Seren
# source  https://github.com/GuillaumeSeren/bashrc
# file    ~/.bashrc.alias
# Licence GPLv3
#
# Alias file for bashrc
# ---------------------------------------------

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	alias dir='dir --color=auto'
	alias vdir='vdir --color=auto'
	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# some more ls aliases
# List files
# Group dir first and end it with /
alias ls='ls --color=always -hFH --group-directories-first'
alias l='ls -CFlh'
alias ll='ls -alh'
alias la='ls -A'

# grep
alias cgrep='grep --color=always'
alias grepc='grep -v \^#'

# Bash related
alias x='exit'
alias path='echo $PATH'

# Moving in dir
alias cd..='cd ..'
alias cd-='cd -'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# du
alias du='du -kh'
alias dud='du --max-depth=0'

# df
alias df='df -kTh'

# shortcut
alias ps='ps aux'
alias cp='cp -i'
alias mv='mv -iv'
alias removeemptylines="sed -i -e '/^$/d'"
alias epoch='date +%s'
