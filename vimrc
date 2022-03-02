" I'v been using vim for about 2 years now, mostly because I can't figure out
" how to exit it.
syntax on                       " 支持语法高亮
filetype plugin indent on       " 根据文件类型启用自动缩进
set encoding=utf-8

set fsync                       " 调用fsync()实现更健壮的文件保存
set history=10000
set sidescroll=1                " 更平滑的边侧滚动跳
set number                      " 显示行号
set relativenumber              " 显示相对行号
set ruler                       " 右下角显示行列数
set laststatus=2                " 总显示状态栏目
set showcmd                     " 在状态栏中显示最后执行的命令
set cursorline                  " 高亮当前行
set linebreak                   " 单词软换行
set autoread                    " 从磁盘自动重载文件
set nowrapscan                  " / ? 不循环查找
" cindent smartindent autoindent 三种自动缩进
set smartindent
set expandtab                   " tab转换为空格
set tabstop=4                   " tab宽度
set shiftwidth=4                " 缩进宽度
set termguicolors               " 24bit color
set mouse=a                     " 启用鼠标
set backspace=2                 " 在多数终端上修正backspace行为
set backspace=indent,eol,start  " 现代编辑器的退格问题
set belloff=all                 " 禁用错误报警声
set cscopeverbose               " 详细输出cscope结果
set hlsearch                    " 高亮查找结果
set incsearch                   " 增量查找
set ignorecase
set smartcase
colorscheme solarized " hybrid
set colorcolumn=80              " 显示边界列


if !has('nvim')
    set display+=lastline
else
    set display=lastline,msgsep    " 较长的文本行漂亮显示 显示更多的文本消息
endif

" 进入命令历史  q:
" normal模式
" >> 增加缩进
" << 减少缩进
" '数字 >>' or '数字 <<'，指定作用的行数

" set spell                       " 基于拼写建议补全
" vim插入补全模式
" ctrl + x 启用
" ctrl + i 补全整行
" ctrl + j 补全标签
" ctrl + f 补全文件名
" s 基于拼写补全

" :vimgrep 模式 路径
" :cn :cp 遍历所有匹配项目
" :copen 打开QuickFix窗口

" 复制yank
" ye复制一个单词
" vim使用寄存器支持copy/paste
" 寄存器通过"开始 a-z
" "aye 复制一个单词到a寄存器中
" "ap 使用a寄存器粘贴
" 无名寄存器使用""引用
" 0-9寄存器表示最后10次操作历史
" 只读寄存器 %当前文件名 #上次文件名 .最后插入文本 :最后执行命令
" reg显示寄存器内容
"
" 字母命令寄存器a-z可以追加内容 使用大写字母 "Ayw
"
" 从外部复制文本到vim
" * 系统主粘贴板
" + ctrl + c / ctrl + v 复制

set clipboard=unnamed,unnamedplus  " 复制到系统寄存器* +

" 交换文件
" if !isdirectory("$HOME/.vim/swap")
"     call mkdir($HOME . "/.vim/swap", "p")
" endif
" set directory="$HOME/.vim/swap/"

" 持久性撤销
set undofile
if !isdirectory("$HOME/.vim/undodir")
    call mkdir($HOME . "/.vim/undodir", "p")
endif
set undodir="$HOME/.vim/undofile"

" :sp  上下分屏
" :vsp 左右分屏
" :res +N -N        改变窗口大小
" :vert res +N -N
"
" visual mode 按o可以在2端跳
" R 进入替换模式

" 标签
" :tabnew :tabn :tabp
" gt=:tabn gT=:tabp
" tabmove N 标签移动
" tabclose 关闭标签

" 折叠
" zc 折叠代码
" za zA 折叠状态切换
" zR zM 打开 关闭所有
"
 set foldmethod=indent
" set foldcolumn=8

" 命令补全
set wildmenu                    " 启用增强的tab自动补全
set wildmode=list:longest,full  " 补全为运行的最长字符串，然后打开wildmenu

" ctrl + ] 跳转到函数的定义

" 插件目录 .vim/pack/plugins/start .vim/pack/plugins/opt

packloadall            " 加载所有插件
silent! helptags ALL   " 为所有插件加载帮助文档

" :ls 列缓冲区
" :b x 切换缓冲区
" :bd 关闭缓冲区


" 检查是否右vim-plug没有就安装
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \https://raw.github.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" 检查插件运行慢的情况
" :profile profile.log
" :profile func *
" :profile file *
"
" vim --startuptime log.log

" 命令行模式
" ctrl + f 打开可编辑命令行窗口
"

let g:plug_timeout=300         " vim-plug超时时间

call plug#begin()
" 自动补全
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" 主题
Plug 'w0ng/vim-hybrid'
Plug 'altercation/vim-colors-solarized'
" NERDTree 支持书签Bookmark
" :Bookmark 收藏当前光标的目录到Bookmarks中
" :ClearBookmarks xx xx 清除
" B 显示隐藏Bookmark
" :NERDTreeToggle 显示隐藏NERDTree
"
" ?: 快速帮助文档
" o: 打开一个目录或者打开文件，创建的是buffer，也可以用来打开书签
" go: 打开一个文件，但是光标仍然留在NERDTree，创建的是buffer
" t: 打开一个文件，创建的是Tab，对书签同样生效
" T: 打开一个文件，但是光标仍然留在NERDTree，创建的是Tab，对书签同样生效
" i: 水平分割创建文件的窗口，创建的是buffer
" gi: 水平分割创建文件的窗口，但是光标仍然留在NERDTree
" s: 垂直分割创建文件的窗口，创建的是buffer
" gs: 和gi，go类似
" x: 收起当前打开的目录
" X: 收起所有打开的目录
" e: 以文件管理的方式打开选中的目录
" D: 删除书签
" P: 大写，跳转到当前根路径
" p: 小写，跳转到光标所在的上一级路径
" K: 跳转到第一个子路径
" J: 跳转到最后一个子路径
" <C-j>和<C-k>: 在同级目录和文件间移动，忽略子目录和子文件
" C: 将根路径设置为光标所在的目录
" u: 设置上级目录为根路径
" U: 设置上级目录为跟路径，但是维持原来目录打开的状态
" r: 刷新光标所在的目录
" R: 刷新当前根路径
" I: 显示或者不显示隐藏文件
" f: 打开和关闭文件过滤器
" q: 关闭NERDTree
" A: 全屏显示NERDTree，或者关闭全屏"
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'
" JavaScript格式化器
" :call JsBeautify()
" :call JsonBeautify()
" :call JsxBeautify()
" :call HtmlBeautify()
" :call CSSBeautify()
"Plug 'maksimr/vim-jsbeautify', { 'for': 'javascript'}
" 增加 - 符号 用于目录浏览
"Plug 'tpope/vim-vinegar'
" 模糊补全插件
" ctrl + p 窗口出现
" ctrl + j / k遍历列表
" ctrl + b / f file mru buffer 间切换
" :CtrlPBuffer :CtrlPMRU :CtrlPMixed
Plug 'ctrlpvim/ctrlp.vim'
" ack.vim 需linux ack 配合使用 用于搜索代码库
" Plug 'mileszs/ack.vim'
" \\先导键
" w右一个狭义单词 W右一个广义单词
" b左一个狭义单词 B左一个广义单词
Plug 'easymotion/vim-easymotion'
" :help vim-plug需要
Plug 'junegunn/vim-plug'
"Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}
" 撤销树
" :GundoToggle
"Plug 'sjl/gundo.vim'
" vim git插件
" :Gstatus :Glog :Gblame
Plug 'tpope/vim-fugitive'
" Plug 'posva/vim-vue'
Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" 自定义状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'
" 高亮显示行尾空格
" :FixWhitespace 自动删除
Plug 'bronson/vim-trailing-whitespace'
" 使用clang-format格式化代码
Plug 'rhysd/vim-clang-format'
" Python autopep8 格式化
Plug 'tell-k/vim-autopep8'
" 缩进线
Plug 'Yggdroot/indentline'
" python-mode
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
" 源文件和头文件切换
Plug 'vim-scripts/a.vim'
Plug 'voldikss/vim-floaterm'

Plug 'mhinz/vim-startify'
Plug 'preservim/tagbar'

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

Plug 'suan/vim-instant-markdown'

Plug 'luochen1990/rainbow'


" debug
Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-rust --enable-python'}
call plug#end()

"let g:vim_markdown_math = 1
"let g:vim_markdown_auto_extension_ext ='txt'
"let g:vim_markdown_no_default_key_mappings = 1
"let g:vim_markdown_folding_disabled = 1

"let g:vim_markdown_folding_style_pythonic = 1
"let g:vim_markdown_override_foldtext = 0

"let g:vim_markdown_folding_level = 6
"let g:vim_markdown_toc_autofit = 1
"let g:vim_markdown_emphasis_multiline = 0
"let g:vim_markdown_fenced_languages = ['csharp=cs']
"let g:vim_markdown_strikethrough = 1

" airline配置
if !exists('g:airline_symbols')
    let g:airline_symbols={}
endif
let g:airline_left_sep=''
let g:airline_right_sep=''
" 不使用默认字符
let g:airline_symbols.linenr='|'
let g:airline_symbols.maxlinenr='|'
let g:airline_symbols.colnr='c:'
let g:airline#extensions#tabline#enabled=1
" let g:airline#extensions#whitespace#enabled=0
set t_Co=256
" set lazyredraw
" 使用powerline打过补丁的字体
" let g:airline_powerline_fonts=1

" 格式化代码配置
let g:clang_format#auto_format=1

let NERDTreeShowBookmarks=1    " 显示书签
let NERDTreeShowLineNumbers=1  " 显示行号
" NERDTree中显示Git状态
" nerdtree-git-plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" 窗口切换 重定义
noremap <c-h> <c-w><c-h>
noremap <c-l> <c-w><c-l>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>

" 重命名和重构
nmap ,rn <Plug>(coc-rename)
nmap ,rf <Plug>(coc-refactor)

" 插入模式成对输入符号
"inoremap ' ''<esc>i
"inoremap " ""<esc>i
"inoremap ( ()<esc>i
"inoremap { {}<esc>i
"inoremap [ []<esc>i

" 树形目录
nmap ,l :NERDTreeFind<cr>
nmap ,g :NERDTreeToggle<cr>

" 文件模糊查找
nmap ,f :FZF<cr>

" 悬浮终端
nmap ,t :FloatermToggle<cr>

"tagbar
nmap ,tag :TagbarToggle<cr>

" 头文件切换
nmap ,a :A<cr>

" vim-markdown显示级别
nmap ,mp :set cole=3<cr>
nmap ,ms :set cole=0<cr>

nmap ,fw :FixWhitespace<cr>

let g:startify_files_number = 20
let g:startify_session_autoload = 1

" autocmd VimEnter * NERDTree    " 自动启动NERDTree
" 当NERDTree窗口是最后一个窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") &&
            \ b:NERDTree.isTabTree()) | q | endif

let g:gundo_prefer_python3=1

" for vue
"autocmd BufNewFile,BufRead *.html,*.js,*.ts,*.vue set tabstop=2
"autocmd BufNewFile,BufRead *.html,*.js,*.ts,*.vue set softtabstop=2
"autocmd BufNewFile,BufRead *.html,*.js,*.ts,*.vue set shiftwidth=2
"autocmd BufNewFile,BufRead *.html,*.js,*.ts,*.vue set expandtab
"autocmd BufNewFile,BufRead *.html,*.js,*.ts,*.vue set autoindent
"autocmd BufNewFile,BufRead *.html,*.js,*.ts,*.vue set fileformat=unix

"auto filetype vue syntax sync fromstart

" vim 正则表达式
" vim中除了.和*外，其他的特殊字符都需要\转义
" . 任意字符，不包括行尾
" ^ 行首
" $ 行尾
" \_任意字符，包括行尾
" \<单词开始
" \>单词结尾
" 字符类
" \s 一个空白符 包括tab和space
" \d 一个数字
" \w 一个单词 包括数字 字母 下划线
" \l 一个小写字母
" \u 一个大写字母
" \a 一个字母
" 大写版本 表示反类
" [a-z0-9]表示一个集合
" [^a-z0-9] 一个集合的补集
" \| 交替
" \(\)分组
"
" mice hungint cat
" 每个字符 无论是字面字符还是特殊字符 或 字符区间后面 都可以接一个量词
" vim中称为重数
"
" * 0或多个 贪婪匹配
" \+ 1个或多个 贪婪匹配
" \{-} 0或多个 非贪婪匹配
" \?或\= 0或1个 贪婪匹配
" \{n,m} n-m个 贪婪匹配
" \{-n,m} n-m个 非贪婪匹配
"
" vim 魔法模式 影响\符号的使用
" 基本魔法 无魔法 深度魔法
"
" 基本魔法 \m   :s/\mfoo/bar
" 默认模式 大部分符号都需要使用\
"
" 无魔法
" . * 也需要\   \M
"
" 深度魔法
" \v 将数字 字母 和 下划线之外的字符都作为特殊字符 " :s/\vfoo/bar
" 特殊字符比较多时 使用
" :s/\(cat\) hunging \(mice\)/\2 hunting \1
" :s/\v(cat) hunging (mice)/\2 hunting \1

" <TAB> to select candicate forward or pump completion candicate
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
" <s-TAB> to select candicate backward
inoremap <expr><s-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.')-1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

" <CR> to comfirm selected candidate
" only when there's selected complete item
if exists('*complete_info')
  inoremap <silent><expr> <CR> complete_info(['selected'])['selected'] != -1 ? "\<C-y>" : "\<C-g>u\<CR>"
endif


nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if(index(['vim', 'help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD :tab sp<CR><Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
