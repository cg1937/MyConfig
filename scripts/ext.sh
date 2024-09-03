#!/bin/bash

# Set color variables
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

ex() {
  if [[ -z $1 ]] ; then
    echo -e "${GREEN}usage: ext <filename>${NC}"
    echo -e "${GREEN}Extract the file specified based on the extension${NC}"
  elif [[ -f $1 ]] ; then
    case $1 in
      *.tar)       tar xvf    $1 ;;
      *.tbz2)      tar xvf    $1 ;;
      *.tgz)	   tar xvf    $1 ;;
      *.tar.bz2)   tar xvf    $1 ;;
      *.tar.gz)    tar xvf    $1 ;;
      *.tar.xz)    tar xvf    $1 ;;
      *.tar.Z)     tar xvf    $1 ;;
      *.bz2)       bunzip2    $1 ;;
      *.rar)       rar x      $1 ;;
      *.gz)        gunzip     $1 ;;
      *.zip)       unzip      $1 ;;
      *.Z)         uncompress $1 ;;
      *.xz)        xz -d      $1 ;;
      *.lzo)       lzop -dv   $1 ;;
      *.7z)        7z x       $1 ;;
      *)           echo -e "${RED}'$1' cannot be extracted via ex()${NC}" ;;
    esac
  else
    echo -e "${RED}'$1' is not a valid file${NC}"
  fi
}

ex "$1"
