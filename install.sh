#!/bin/sh

install_path=~/.dotfiles

while getopts "p:" option; do
  case $option in
    p ) install_path=$OPTARG
    ;;
  esac
done

mkdir -p "$install_path"
git clone https://github.com/owlcall/dots "$install_path"
cd "$install_path"
"$install_path/vim/activate.sh"

