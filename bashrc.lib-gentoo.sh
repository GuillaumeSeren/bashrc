# ---------------------------------------------
# @author Guillaume Seren
# source  https://github.com/GuillaumeSeren/bashrc
# file    ~/.bashrc.lig-gentoo.sh
# Licence GPLv3
#
# Preset for Gentoo Os
# Most of the preset are for the admin of the system
# ---------------------------------------------

alias upGrade='sudo emerge-webrsync && sudo emerge -auvDN @world --tree --backtrack=30'
alias upRebuild='sudo revdep-rebuild -v && sudo revdep-rebuild && sudo emerge --update --newuse --deep @world'
alias upUpdater='sudo perl-cleaner --all && sudo python-updater'
alias upClean='sudo eclean-dist -d && sudo emerge --depclean'
# @TODO Add a check on external dependencies
alias upCheck='sudo checkrestart'
alias dup='upGrade && upRebuild && upUpdater && upClean && upCheck'
alias up='dup'
