
# Shell options
set t_Co=256
autoload colors; colors;

HISTFILE=~/.zsh_history
HISTSIZE=2048
SAVEHIST=1048576
setopt appendhistory
setopt sharehistory
setopt incappendhistory

# Keyboard bindings
bindkey '^R' history-incremental-search-backward

# General utility functions

function detect_ssh() {
  # Recursively check each parent process until sshd is found or init
  # process is reached.
  #
  # Args:
  #   $1: parent process ID
  # Return:
  #   0: detected SSH
  #   1: did not detect SSH
  #
  if [[ "$(ps -o comm= -p $1)" =~ sshd ]]; then
    return 0;
  elif [ "$1" -le 1 ]; then
    return 1;
  fi
  detect_ssh $(ps -o ppid= -p $1)
}

# Prompt customization

cyan_fg=$(echo '\x1b[38;5;032m')
orange_fg=$(echo '\x1b[38;5;202m')
reset=$(echo '\x1b[0m')

# accent color is decided based on being root/non-root
accent=$cyan_fg
PROMPT_SYMBOL='$'
if [[ `id -u` == '0' ]]; then
  accent=$orange_fg
  PROMPT_SYMBOL='#'
fi

# prompt prefix with hostname is added only on SSH connections
PROMPT_PREFIX=''
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] || detect_ssh $PPID; then
  PROMPT_PREFIX="%{$accent%}[%{$reset%}%m%{$accent%}]%{$reset%} "
fi
PROMPT="$PROMPT_PREFIX%{$reset%}%(4~|%-1~/../%2~|%3~) %{$accent%}$PROMPT_SYMBOL%{$reset%} "

# Aliases

#export LSCOLORS "gxdxCxFxbxDxDxhbadExEx"
alias l='ls -lhHG'
alias ls='ls -G'
alias grep='grep --color=always'

