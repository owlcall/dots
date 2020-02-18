#!/bin/sh

DIR="$( cd -P "$( dirname "$0" )" >/dev/null 2>&1 && pwd )"

# Install a csh configuration file
if [ ! -f "$HOME/.zshrc" ]; then
  ln "$DIR/original.zshrc" "$HOME/.zshrc"
  echo changed: symlinked "$HOME/.zshrc" zsh configuration
else
  if [ ! -f "$HOME/.zshrc.old" ]; then
    mv "$HOME/.zshrc" "$HOME/.zshrc.old"
    echo changed: backed up ~/.zshrc to "$HOME/.zshrc.old"
    ln "$DIR/original.zshrc" "$HOME/.zshrc"
    echo changed: symlinked new "$HOME/.zshrc" zsh configuration
  else
    echo note: ~/.zshrc already exists, skipping zsh onfiguration
  fi
fi


