#!/bin/sh

#SOURCE="${BASH_SOURCE[0]}"
#while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  #DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  #SOURCE="$(readlink "$SOURCE")"
  #[[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
#done
#DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
DIR="$( cd -P "$( dirname "$0" )" >/dev/null 2>&1 && pwd )"

if [ ! -d "$HOME/.vim/bundle" ]; then
  mkdir -p "$HOME/.vim/bundle"
  echo changed: created "$HOME/.vim/bundle"
else
  echo note: vim bundle dir already exists, skipping bundle directory creation
fi

if [ ! -d "$HOME/.vim/colors" ]; then
  mkdir -p "$HOME/.vim/colors"
  echo changed: created "$HOME/.vim/colors"
else
  echo note: vim colors dir already exists, skipping colors directory creation
fi

#[ ! -d "/Users/owl/.vim/bundle/Vundle" ]
#echo $?
#echo "$HOME/.vim/bundle/Vundle"

# Clone vundle
if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
  echo attempting to install vundle...
  if hash git 2>/dev/null; then
    git clone https://github.com/VundleVim/Vundle.vim.git "$HOME/.vim/bundle/Vundle.vim"
    echo changed: cloned Vundle.vim
  else
    echo error: git not installed, install git and try again
    exit -1
  fi
fi

# Install themes (as symlinks)
if [ ! -f "$HOME/.vim/colors/theme.vim" ]; then
  ln "$DIR/theme.vim" $HOME/.vim/colors/
  echo changed: simlinked "$DIR/theme.vim"
else
  echo note: theme.vim already exists, skipping theme configuration
fi

# Install a link to the vimrc
if [ ! -f "$HOME/.vimrc" ]; then
  ln "$DIR/original.vimrc" $HOME/.vimrc
  echo changed: simlinked "$HOME/.vimrc"
  vim +PluginInstall +qall
else
  echo note: ~/.vimrc already exists, skipping ~/.vimrc configuration
fi

# Install vim plugins
if [ ! -f "$HOME/.vim/bundle/vim-airline-themes/autoload/airline/themes/airtheme.vim" ]; then
  ln "$DIR/airtheme.vim" $HOME/.vim/bundle/vim-airline-themes/autoload/airline/themes/
  echo changed: simlinked "$DIR/airtheme.vim"
else
  echo note: airtheme.vim already exists, skipping airline theme configuration
fi

