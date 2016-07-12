# ---------------------------------------------
# @author Guillaume Seren
# source  https://github.com/GuillaumeSeren/bashrc
# file    ~/.bashrc.lig-gentoo.sh
# Licence GPLv3
#
# Preset for Gentoo Os
# Most of the preset are for the admin of the system
# ---------------------------------------------

# @TODO Add a check on external dependencies
alias up='dup'
alias dup='upGrade && upRebuild && upClean && upCheck'
alias upGrade='sudo emerge --sync && sudo emerge -avuDN --with-bdeps y --keep-going world'
alias upRebuild='sudo revdep-rebuild -v && sudo revdep-rebuild && sudo emerge --update --newuse --deep @world && sudo emerge @module-rebuild && sudo emerge @preserved-rebuild'
alias upClean='sudo eclean-dist -d && sudo emerge -av --depclean'
alias upCheck='sudo env-update && sudo checkrestart && sudo glsa-check --test all'

