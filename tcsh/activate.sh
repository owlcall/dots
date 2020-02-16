#!/bin/sh

DIR="$( cd -P "$( dirname "$0" )" >/dev/null 2>&1 && pwd )"

# Install a csh configuration file
if [ ! -f "$HOME/.cshrc" ]; then
  ln "$DIR/original.cshrc" $HOME/.cshrc
  echo changed: symlinked "$HOME/.cshrc" tcsh configuration
else
  echo note: ~/.cshrc already exists, skipping csh onfiguration
fi


