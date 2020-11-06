syntax on                    " 支持语法高亮显示
filetype plugin indent on    " 启用根据文件类型自动缩进

set autoindent               " 开始新行时处理缩进
set expandtab                " 将制表符Tab展开为空格
set tabstop=4
set shiftwidth=4

set backspace=2

set ruler
set number

set mouse=a

set hlsearch
set incsearch

set foldmethod=indent

" 为所有文件设置持久性撤销
set undofile
if !isdirectory("/home/gaopeng/.vim/undodir")
    call mkdir("/home/gaopeng/.vim/undodir", "p")
endif
set undodir=/home/gaopeng/.vim/undodir

" 简化窗口间跳转 ctrl+w h/j/k/l
noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>


call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

call plug#end()
