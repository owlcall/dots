#!/bin/sh

only=0
only_vim=0
only_tmux=0
install_path=~/.dotfiles

args=`getopt p:o: $*`
set -- $args

while :; do
  case  "$1" in
    -p )
      install_path=$2
      shift; shift;
      ;;
    -o )
      case $2 in
        vim)
          echo OPTION: $2
          only=1
          only_vim=1
          ;;
        tmux)
          echo OPTION: $2
          only=1
          only_tmux=1
          ;;
      esac
      shift; shift;
      ;;
    -- )
      break
      ;;
  esac
done

mkdir -p "$install_path"
git clone https://github.com/owlcall/dots "$install_path"
cd "$install_path"
git checkout master
git pull origin master

echo \\nPreparing activations...\\n

if [[ (only -ne 1) || (only -eq 1 && only_vim -eq 1) ]] ; then
  echo Activating vim...
  echo -----------------
  "$install_path/vim/activate.sh"
fi

echo

if [[ (only -ne 1) || (only -eq 1 && only_tmux -eq 1) ]] ; then
  echo Activating tmux...
  echo ------------------
  "$install_path/tmux/activate.sh"
fi

