# ---------------------------------------------
# @author Guillaume Seren
# source  https://github.com/GuillaumeSeren/bashrc
# file    ~/.bashrc.local.sh
# Licence GPLv3
#
# local/user config file
# ---------------------------------------------

# @TODO Add a user specific config file (gitignore)
# Select debian or gentoo
system='gentoo'
if [[ $system == 'debian' ]]; then
  # Debian
  alias up='sudo aptitude update && sudo aptitude safe-upgrade && sudo checkrestart'
  alias cl='sudo aptitude remove --purge `deborphan` && sudo aptitude autoclean'
  alias se='sudo aptitude search'
  alias ins='sudo aptitude install'
elif [[ $system == 'gentoo' ]]; then
  alias upGrade='sudo emerge-webrsync && sudo emerge -auvDN @world --tree --backtrack=30'
  alias upRebuild='sudo revdep-rebuild -v && sudo revdep-rebuild && sudo emerge --update --newuse --deep @world'
  alias upUpdater='sudo perl-cleaner --all && sudo python-updater'
  alias upClean='sudo eclean-dist -d && sudo emerge --depclean'
  # @TODO Add a check on external dependencies
  alias upCheck='sudo checkrestart'
  alias dup='upGrade && upRebuild && upUpdater && upClean && upCheck'
  alias up='dup'
fi

# Load fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
