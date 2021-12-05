#!/bin/sh

cr="\033[1;31m"
cg="\033[1;32m"
cb="\033[1;34m"
case $(uname -s) in 
  Linux*) fontdir=$HOME/.fonts/.;;
  Darwin*) fontdir=$HOME/Library/Fonts/.;;
  *) printf "${cr}Error: Os Not Supported";;
esac
printf "${cr}"
case $1 in 
  *u*) sudo rm -r /usr/local/bin/fp && printf "${cg}[*] FP Uninstalled\n${cr}";;
  *i*) sudo cp fp /usr/local/bin/fp && printf "${cg}[*] FP Installed\n${cr}";;
  *) printf "${cg}Usage: ./install.sh ${cb}[i|u]${cb}
    i:${cg} Install
    ${cb}u:${cg} Uninstall\n"
esac
