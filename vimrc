syntax on

filetype plugin indent on

set ruler
set relativenumber
set number

set smartindent
set expandtab 
set tabstop=4
set shiftwidth=4

set backspace=2

set mouse=a

set hlsearch
set incsearch

set colorcolumn=80

set foldmethod=indent
set foldcolumn=5

" swap dir
if !isdirectory("$HOME/.vim/swap")
    call mkdir($HOME . "/.vim/swap", "p")
endif
set directory="$HOME/.vim/swap/"

set undofile
if !isdirectory("$HOME/.vim/undodir")
    call mkdir($HOME . "/.vim/undodir", "p")
endif
set undodir="$HOME/.vim/undodir"

noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>

call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

call plug#end()
