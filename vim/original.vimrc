" Author: Tim Vasko
" Date: 2019-11-24
" Description: Vim configuration file

"
" Plugins
"------------------------------------------------------------------------------
"
" Vundle is cloned from https://github.com/VundleVim/Vundle.vim.git
"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
  Plugin 'gmarik/Vundle.vim'
  "Plugin 'airblade/vim-gitgutter'
  "Plugin 'ludovicchabant/vim-gutentags'
  Plugin 'christoomey/vim-tmux-navigator'
  Plugin 'kien/ctrlp.vim'
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'google/vim-searchindex'
  Plugin 'SirVer/ultisnips'
  Plugin 'honza/vim-snippets'
call vundle#end()            " required

"
" Auto-command Configuration
"------------------------------------------------------------------------------
"
filetype plugin indent on

if has ('autocmd')
  " Restore cursor position when opening files
	augroup RestoreCursor
		autocmd!
		autocmd BufReadPost * call setpos(".", getpos("'\""))|normal zz
	augroup END

  " File-type specific configurations
  autocmd FileType crontab setlocal nowritebackup
  "autocmd Filetype markdown setlocal spell spelllang=en_us

  " Line horizontal highlight
	augroup LineCursor	" Handle highlighting of the current line (disable on insert)
    autocmd WinEnter * set cursorline
    autocmd WinLeave * set nocursorline

    autocmd InsertEnter * set nocursorline
    autocmd InsertLeave * set cursorline

    autocmd FocusGained * set cursorline
    autocmd FocusLost * set nocursorline | redraw!
	augroup END
endif

"
" Visual/Aesthetic Configuration
"------------------------------------------------------------------------------
"
colorscheme theme
syntax on		" Enable syntax highlighting across the board

" Special syntax highlighting (agnostic of filetype)
augroup vimrc_todo
  au Syntax * syn match MyTodo /\v<(NOTE|NOTES|OPTIMIZE)>/ containedin=.*Comment,.*Comment.*
augroup END
hi def link MyTodo Todo

set background=dark
set fillchars+=vert:│

" Enable the tabline extension which shows all buffers
let g:airline_theme = "airtheme"

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = ' %s '
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#tabs_label = ''
let g:airline_symbols_ascii = 1

let g:airline_section_a = ''		" mode/crypt/paste/spell
let g:airline_section_b = ''		" branch
"let g:airline_section_c = '%t'		" bufferline or filename
let g:airline_section_x = ''		" tagbar/filetype/virtualenv
let g:airline_section_y = ''		" encoding/fileformat
let g:airline_section_z = '%l : %v' " line : column indicator
let g:airline_section_error   = ''	" errors notification
let g:airline_section_warning = ''	" warnings notification
let g:airline_powerline_fonts = 0	" disable powerline fonts

" Ensure the vertical bars match the airline colors in the horizontal highlights
hi VertSplit ctermbg=NONE ctermfg=240

let s:M = 'cterm'
let s:B = 'bold'
let s:BG        = 'none'
let s:ORANGE2 = '208'	" 

"
" General Configuration
"------------------------------------------------------------------------------
"
" Positional settings
set splitbelow		" Use bottom split for a new horizontal split buffer
set splitright		" Use right split for a new vertical split buffer

" General settings
set secure
set antialias		      " Enable antialiasing on Mac OS X
set encoding=utf-8	  " Default utf-8 encoding
set history=1024	    " Increase command history
set clipboard=unnamed	" Allow us to use system clipboard"

set shortmess+=O      " file-read message overwrites previous
set shortmess+=o      " overwrite file-written messages

"let g:netrw_preview=1 " Make vertical previews default
let g:netrw_liststyle = 3
let g:netrw_winsize   = 20

if exists('&belloff')
  set belloff=all	" never ring the bell for any reason
endif

" CTRL+P Configuration
set wildignore+=.git
set wildignore+=*~,*.swp,*.swo,*.tmp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.gz,*.tar     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = '\v[\/]\.?(tags|deps|build|env|git|hg|svn)$'

" INDENTATION
set tabstop=2     " width of the TAB character
set shiftwidth=2  " depth of single indentation level
set softtabstop=2
set expandtab

set cindent     " ehnable advanced indentation tailored towards c-style languages
set cino+=g0    " indent public/private keywords after typing colon ':'
set autoindent

" Editor display
set relativenumber
set number
set hlsearch    	" Highlight search results
set cursorline		" Highlight cursor line
"set laststatus=2  " Show statusbar all the time
"set scrolloff=1   " Scroll offset of 1 line
set showmatch	  	" Show matching bracket
set wildmenu	  	" Show advanced autocompletion in command mode
set nojoinspaces	" don't autoinsert two spaces after '.', '?', '!' for join command
"set colorcolumn=80

" Keyboard response time
set ttimeoutlen=10

" Built in fatures
"set omnifunc=syntaxcomplete#Complete

" Fixes
"-------
" Fix the backspace key from getting stuck on one line
set backspace=indent,eol,start
" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif
" Fix key bindings if running within tmux on mac
if &term =~ '^screen'
	" tmux will send xterm-style keys when its xterm-keys option is on
	execute "set <xUp>=\e[1;*A"
	execute "set <xDown>=\e[1;*B"
	execute "set <xRight>=\e[1;*C"
	execute "set <xLeft>=\e[1;*D"
endif

"
" Custom key bindings
"------------------------------------------------------------------------------
"
" Bind leader key to <space>
let mapleader = " "
nmap \ <Leader>

" UltiSnips triggering
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

" Disabling arrow keys (forming habbits!)
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"=== Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"=== Split resizing
nnoremap <Down> <C-w>-
nnoremap <Up> <C-w>+
nnoremap <Left> <C-w><
nnoremap <Right> <C-w>>

"=== Navigation bindings
"nnoremap <silent> <Leader>q :bd\|bd #<CR>	" Destroy buffer
"nnoremap <silent> <S-Tab> : bp<CR>	" Previous buffer
"nnoremap <silent> <Tab> : bn<CR>	" Next buffer
nnoremap <silent> <Leader>d :bp \| bd! #<CR>	" Destroy buffer
nnoremap gtd :YcmCompleter GoToDeclaration<CR>
nnoremap gtf :YcmCompleter GoToDefinition<CR>


"nnoremap gte: YcmCompleter GoToDeclaration<CR>
"nnoremap gtd :YcmCompleter GoToDefinition<CR>

nnoremap <silent> <Tab> :bn<CR>
nnoremap <silent> <S-Tab> :bp<CR>

"=== Quickfix navigation
"TODO: consider remapping these to Leader-n / Leader-p
"nnoremap <silent> <Leader>e :cn <CR>		" Open file/line for next error in quickfix window
"nnoremap <silent> <Leader><S-e> :cp <CR>	" Open file/line for previous error in quickfix window

"=== Display toggles
"nnoremap <silent> <leader>l :call ToggleList("Location List", 'l')<CR>
"nnoremap <silent> <leader>f :call ToggleList("Quickfix List", 'c')<CR>	" Toggle quickfix view
nnoremap <silent> <Leader><Leader> :nohlsearch<CR>						" Clear highlighting
"nnoremap <silent> <Esc><Esc> :nohlsearch<CR>							" Clear highlighting
nnoremap <silent> <C-n>	   :let [&nu, &rnu] = [!&rnu, &nu+&rnu==1]<CR>	" Toggle line numbers
nnoremap <silent> <Leader>o :Le<CR>										" Open editor window

"=== Editor bindings
"nnoremap <space> za|					" Enable folding with the spacebar
nnoremap <silent> <Leader>w :w !diff % -<CR>|	" Show differences before writing to file
nnoremap <silent> <Leader>s :w<CR>

" Disable Ctrl-C interrupt, in order to train proper shortcut usage
imap <C-C> <Nop>

