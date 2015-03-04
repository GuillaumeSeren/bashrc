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
# ls
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alh'
alias lsd='ls -d */'
alias lll='ls -la | less'

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

# Admin
alias log='tail -f /var/log/mail.log'
alias stat="echo ' ' && uname -a && echo ' '&& uptime &&echo ' '&& df && echo ' '"
alias myps='/bin/ps -u "$USER" -o user,pid,ppid,pcpu,pmem,args|less'

# Debian
alias up='sudo aptitude update && sudo aptitude safe-upgrade && sudo checkrestart'
alias cl='sudo aptitude remove --purge `deborphan` && sudo aptitude autoclean'
alias se='sudo aptitude search'
alias ins='sudo aptitude install'

# shortcut
alias ps='ps aux'
alias cp='cp -i'
alias mv='mv -iv'
alias build='./configure && make'
alias removeemptylines="sed -i -e '/^$/d'"
alias epoch='date +%s'
