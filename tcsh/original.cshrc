# .cshrc - csh resource script, read at beginning of execution by each shell
#
# see also csh(1), environ(7).
# more examples available at /usr/share/examples/csh/
#

setenv LSCOLORS "gxdxCxFxbxDxDxhbadExEx"

alias h    history 25
alias j    jobs -l
alias l    ls -lHG
alias ls   ls -G
alias la   ls -aFG
alias lf   ls -FAG
alias ll   ls -lAFG
alias grep 'grep --color=always'

# A righteous umask
umask 22

set path = (/sbin /bin /usr/sbin /usr/bin /usr/local/sbin /usr/local/bin $HOME/bin)

setenv  EDITOR  vim
setenv  PAGER  less
setenv  BLOCKSIZE  K

set grey_bg   = "%{\033[48;5;236m%}"
set orange_fg = "%{\033[38;5;202m%}"
set cyan_fg   = "%{\033[38;5;032m%}"
set end       = "%{\033[0m%}"

if ($?prompt) then
  set P_NORMAL="${end}${grey_bg}"
  if (`whoami` == 'root' || `whoami` == 'toor') then
    set P_COLOR="${grey_bg}%{$orange_fg%}"
    set P_SYMBOL='#'
  else
    set P_COLOR="${grey_bg}%{$cyan_fg%}"
    set P_SYMBOL='$'
  endif

  set P_PREFIX = "${grey_bg}${P_COLOR}[${P_NORMAL}%m${P_COLOR}]${P_NORMAL}"

  # An interactive shell -- set some stuff up
  #set prompt = "%N@%m:%~ %# "
  set ellipsis = 1
  set prompt = "${P_PREFIX} %c03 ${P_COLOR}%#${end} "
  set promptchars = '$#'

  set filec
  set history = 1000
  set savehist = (1000 merge)
  set autolist = ambiguous
  # Use history to aid expansion
  set autoexpand
  set autorehash
  set mail = (/var/mail/$USER)
  if ( $?tcsh ) then
    bindkey "^W" backward-delete-word
    bindkey -k up history-search-backward
    bindkey -k down history-search-forward
  endif

endif

