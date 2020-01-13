#!/bin/sh

#SOURCE="${BASH_SOURCE[0]}"
#while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  #DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  #SOURCE="$(readlink "$SOURCE")"
  #[[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
#done
#DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
DIR="$( cd -P "$( dirname "$0" )" >/dev/null 2>&1 && pwd )"

mkdir -p ~/.vim/colors
mkdir -p ~/.vim/bundle

# Clone vundle
if [ ! -d ~/.vim ]; then
  if hash git 2>/dev/null; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  else
    echo git not installed, install git and try again
    exit -1
  fi
fi

# Install a link to the vimrc
if [ ! -f ~/.vimrc ]; then
  ln "$DIR/original.vimrc" $HOME/.vimrc
else
  echo ~/.vimrc already exists, skipping vim configuration
  exit 1
fi

# Install vim plugins
vim +PluginInstall +qall

# Install themes (as symlinks)
ln -f "$DIR/theme.vim" ~/.vim/colors/
ln -f "$DIR/airtheme.vim" ~/.vim/bundle/vim-airline-themes/autoload/airline/themes/

