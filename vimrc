set encoding=utf-8
set fsync
set history=10000
set number
set relativenumber
set ruler
set showcmd
set cursorline
set linebreak
set autoread
set nowrapscan
set hlsearch
set incsearch
set ignorecase
set smartcase
set expandtab
set tabstop=4
set shiftwidth=4
set mouse=a

set belloff=all
set cscopeverbose

set colorcolumn=80
set clipboard=unnamed,unnamedplus
set lazyredraw

colorscheme hybrid

noremap <c-h> <c-w><c-h>
noremap <c-l> <c-w><c-l>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>

nmap ,l :NERDTreeFind<cr>
nmap ,g :NERDTreeToggle<cr>
nmap ,f :FZF<cr>
nmap ,t :FloatermToggle<cr>
nmap ,b :TagbarToggle<cr>
nmap ,a :A<cr>
nmap ,mp :set cole=3<cr>
nmap ,ms :set cole=0<cr>
nmap ,fw :FixWhitespace<cr>
nmap ,v <c-w>H
nmap ,h <c-w>K

let g:rainbow_active=1
let g:startify_files_number = 20
let g:startify_session_autoload = 1

if !exists('g:airline_symbols')
    let g:airline_symbols={}
endif
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_symbols.linenr='|'
let g:airline_symbols.maxlinenr='|'
let g:airline_symbols.colnr='c:'
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='papercolor'

let NERDTreeShowBookmarks=1    " 显示书签
let NERDTreeShowLineNumbers=1  " 显示行号
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "Modify",
    \ "Staged"    : "Staged",
    \ "Untracked" : "Untracked",
    \ "Renamed"   : "Renamed",
    \ "Unmerged"  : "Ummerged",
    \ "Deleted"   : "Deleted",
    \ "Dirty"     : "Dirty",
    \ "Clean"     : "Clean",
    \ "Unknown"   : "Unknown"
    \ }

"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

lua require('config')
