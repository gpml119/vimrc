"syntax on                       " 支持语法高亮
"filetype plugin indent on       " 根据文件类型启用自动缩进
set encoding=utf-8
set fsync                       " 调用fsync()实现更健壮的文件保存
set history=10000
"set sidescroll=1                " 更平滑的边侧滚动条
set number                      " 显示行号
set relativenumber              " 显示相对行号
set ruler                       " 右下角显示行列数
"set laststatus=2                " 总显示状态栏目
set showcmd                     " 在状态栏中显示最后执行的命令
set cursorline                  " 高亮当前行
set linebreak                   " 单词软换行
set autoread                    " 从磁盘自动重载文件

"set smartindent

set nowrapscan                  " / ? 不循环查找
set hlsearch                    " 高亮查找结果
set incsearch                   " 增量查找
set ignorecase
set smartcase

set expandtab                   " tab转换为空格
set tabstop=4                   " tab宽度
set shiftwidth=4                " 缩进宽度

set mouse=a                     " 启用鼠标
"set backspace=2                 " 在多数终端上修正backspace行为
"set backspace=indent,eol,start  " 现代编辑器的退格问题

set belloff=all                 " 禁用错误报警声
set cscopeverbose               " 详细输出cscope结果

set colorcolumn=80              " 显示边界列
set clipboard=unnamed,unnamedplus  " 复制到系统寄存器* +
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
"let g:gundo_prefer_python3=1

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
