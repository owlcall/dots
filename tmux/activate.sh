#!/bin/sh

#SOURCE="${BASH_SOURCE[0]}"
#while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  #DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  #SOURCE="$(readlink "$SOURCE")"
  #[[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
#done
#DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
DIR="$( cd -P "$( dirname "$0" )" >/dev/null 2>&1 && pwd )"

# Install a ~/.tmux.conf file
if [ ! -f "$HOME/.tmux.conf" ]; then
  echo "source-file \"$DIR/tmux.conf\"" > "$HOME/.tmux.conf"
  echo "source-file \"$DIR/super.tmuxtheme\"" >> "$HOME/.tmux.conf"
  echo "" >> "$HOME/.tmux.conf"
else
  echo ~/.tmux.conf already exists, skipping tmux configuration
  #exit 1
fi

# Clone battery plugin
if [ ! -d "$DIR/tmux-battery" ]; then
  if hash git 2>/dev/null; then
    git clone https://github.com/tmux-plugins/tmux-battery
    echo "run-shell \"$DIR/tmux-battery/battery.tmux\"" >> "$HOME/.tmux.conf"
  else
    echo git not installed, install git and try again
    exit -1
  fi
fi

