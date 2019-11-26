#!/bin/bash
# ---------------------------------------------
# @author Guillaume Seren
# source  https://github.com/GuillaumeSeren/bashrc
# file    ~/.bashrc.lig-gentoo.sh
# Licence GPLv3
#
# Preset for Gentoo Os
# Most of the preset are for the admin of the system
# ---------------------------------------------

# @TODO Add a check on external dependencies like sudo
# up is upgrade alias
alias upGrade='sudo emerge --sync && sudo eix-update && sudo emerge -avuDN --tree --with-bdeps y --keep-going world'
alias upRebuild='sudo revdep-rebuild -v && sudo revdep-rebuild && sudo emerge --update --newuse --deep @world && sudo emerge @module-rebuild && sudo emerge @preserved-rebuild'
alias upClean='sudo eclean-dist -d && sudo emerge -av --depclean'
alias upCheck='sudo env-update && eix-test-obsolete && sudo needrestart && sudo glsa-check --test all'
alias up='upGrade && upRebuild && upClean && upCheck'
