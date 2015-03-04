#!/bin/bash
# ---------------------------------------------
# @author Guillaume Seren
# source  https://github.com/GuillaumeSeren/bashrc
# file    ~/.bashrc.function
# Licence GPLv3
#
# Bash Function definition file
# ---------------------------------------------

# repeat n times command
function Repeat() {
    local i max
    max=$1; shift;
    for ((i=1; i <= max ; i++)); do
        eval "$@";
    done
}

# Unpack the file given in arg
Extract() {
    local FILENAME="${1}"
    local FILEEXTENSION=`echo ${1} | cut -d. -f2-`
    case "$FILEEXTENSION" in
        tar)
            tar xvf "$FILENAME";;
        tar.gz)
            tar xzvf "$FILENAME";;
        tgz)
            tar xzvf "$FILENAME";;
        gz)
            gunzip "$FILENAME";;
        tbz)
            tar xjvf "$FILENAME";;
        tbz2)
            tar xjvf "$FILENAME";;
        tar.bz2)
            tar xjvf "$FILENAME";;
        tar.bz)
            tar xjvf "$FILENAME";;
        bz2)
            bunzip2 "$FILENAME";;
        tar.Z)
            tar xZvf "$FILENAME";;
        Z)
            uncompress "$FILENAME";;
        zip)
            unzip "$FILENAME";;
        rar)
            unrar x "$FILENAME";;
    esac
}
