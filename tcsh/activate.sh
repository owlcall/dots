#!/bin/sh

DIR="$( cd -P "$( dirname "$0" )" >/dev/null 2>&1 && pwd )"

if cmp --silent "$HOME/.cshrc" "$DIR/original.cshrc" ; then
  echo note: existing config is identical to desired one
  exit 0
fi

# Install a csh configuration file
if [ ! -f "$HOME/.cshrc" ]; then
  ln "$DIR/original.cshrc" $HOME/.cshrc
  echo changed: symlinked "$HOME/.cshrc" tcsh configuration
else
  if [ ! -f "$HOME/.cshrc.old" ]; then
    mv "$HOME/.cshrc" "$HOME/.cshrc.old"
    echo changed: backed up ~/.cshrc to "$HOME/.cshrc.old"
    ln "$DIR/original.cshrc" $HOME/.cshrc
    echo changed: symlinked new "$HOME/.cshrc" tcsh configuration
  else
    echo note: ~/.cshrc already exists, skipping csh onfiguration
  fi
fi


