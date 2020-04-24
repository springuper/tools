set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Style
Plugin 'zoubin/vim-tabstop'
Plugin 'godlygeek/tabular'
Plugin 'itchyny/lightline.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'kshenoy/vim-signature'
Plugin 'ntpeters/vim-better-whitespace'

" Language
Plugin 'moll/vim-node'
Plugin 'pangloss/vim-javascript'
Plugin 'fatih/vim-go'
Plugin 'mxw/vim-jsx'
Plugin 'nono/vim-handlebars'
Plugin 'elixir-lang/vim-elixir'
Plugin 'leafgarland/typescript-vim'
Plugin 'keith/swift.vim'
Plugin 'hashivim/vim-terraform'
Plugin 'derekwyatt/vim-scala'
Plugin 'udalov/kotlin-vim'
Plugin 'reasonml-editor/vim-reason-plus'

" Autocomplete
" Plugin 'valloric/youcompleteme'
Plugin 'taglist.vim'
Plugin 'w0rp/ale'

" Syntax
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/DrawIt'
Plugin 'tpope/vim-fugitive'

" Layout
Plugin 'scrooloose/nerdtree'

" Others
Plugin 'vimwiki/vimwiki'
Plugin 'tpope/vim-obsession'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Enables syntax highlighting for JSDocs
let g:javascript_plugin_jsdoc = 1
" Enables syntax highlighting for Flow
let g:javascript_plugin_flow = 1

" Enable jsx for normal .js extension
let g:jsx_ext_required = 0

" ALE
let g:ale_completion_enabled = 1
let g:ale_linters = {
  \   'javascript': ['eslint', 'standard', 'tsserver', 'xo'],
  \   'typescript': ['tslint', 'tsserver', 'typecheck', 'xo'],
  \}
let g:ale_javascript_eslint_options = '--no-ignore'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 0
let g:ale_fix_on_save = 1
nmap <C-G> :ALEGoToDefinitionInTab<CR>

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']

" VimWiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

" Taglist
" let Tlist_Auto_Open=1
let Tlist_Ctags_Cmd='/usr/local/Cellar/universal-ctags/HEAD-3fdf28b/bin/ctags'

" Tagbar
nmap <C-T> :TagbarToggle<CR>
let g:tagbar_sort = 0
" let g:tagbar_left = 1
let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'v:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enumerators',
    \ 'g:enums',
    \ 't:types',
    \ 'I:imports',
    \ 'p:properties',
    \ 'C:constants',
    \ 'a:aliases',
    \ 'z:parameters',
  \ ]
\ }

" NERDTree config
nnoremap <C-Y> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Indent Guide
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=23
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=0

" Mark Signature
let g:SignatureMap = {
  \ 'Leader'             :  "m",
  \ 'PlaceNextMark'      :  "m,",
  \ 'ToggleMarkAtLine'   :  "m.",
  \ 'PurgeMarksAtLine'   :  "m-",
  \ 'DeleteMark'         :  "dm",
  \ 'PurgeMarks'         :  "mda",
  \ 'PurgeMarkers'       :  "m<BS>",
  \ 'GotoNextLineAlpha'  :  "']",
  \ 'GotoPrevLineAlpha'  :  "'[",
  \ 'GotoNextSpotAlpha'  :  "`]",
  \ 'GotoPrevSpotAlpha'  :  "`[",
  \ 'GotoNextLineByPos'  :  "]'",
  \ 'GotoPrevLineByPos'  :  "['",
  \ 'GotoNextSpotByPos'  :  "mn",
  \ 'GotoPrevSpotByPos'  :  "mp",
  \ 'GotoNextMarker'     :  "[+",
  \ 'GotoPrevMarker'     :  "[-",
  \ 'GotoNextMarkerAny'  :  "]=",
  \ 'GotoPrevMarkerAny'  :  "[=",
  \ 'ListLocalMarks'     :  "ms",
  \ 'ListLocalMarkers'   :  "m?"
  \ }

"==========================================
" General 基础设置
"==========================================

"set guifont=Monaco:h20          " 字体 && 字号

" history存储长度。
set history=2000

"检测文件类型
filetype on
"针对不同的文件类型采用不同的缩进格式
filetype indent on
"允许插件
filetype plugin on
"启动自动补全
filetype plugin indent on

"非兼容vi模式。去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
set nocompatible
set autoread          " 文件修改之后自动载入。
set shortmess=atI       " 启动的时候不显示那个援助索马里儿童的提示

" 备份,到另一个位置. 防止误删, 目前是取消备份
"set backup
"set backupext=.bak
"set backupdir=~/bak/vimbk/

" 取消备份。 视情况自己改
set nobackup
set noswapfile

" 突出显示当前行等 不喜欢这种定位可注解
" set cursorcolumn
" set cursorline              " 突出显示当前行

"设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制
"好处：误删什么的，如果以前屏幕打开，可以找回
set t_ti= t_te=

"- 则点击光标不会换,用于复制
set mouse-=a           " 鼠标暂不启用, 键盘党....
" 修复ctrl+m 多光标操作选择的bug，但是改变了ctrl+v进行字符选中时将包含光标下的字符
"set selection=exclusive
set selection=inclusive
set selectmode=mouse,key

" No annoying sound on errors
" 去掉输入错误的提示声音
set title                " change the terminal's title
set novisualbell           " don't beep
set noerrorbells         " don't beep
set t_vb=
set tm=500

"==========================================
" Show 展示/排班等界面格式设置
"==========================================

"显示行号：
set number
"set nowrap                    " 取消换行。

"括号配对情况
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

"设置文内智能搜索提示
" 高亮search命中的文本。
set hlsearch
" 搜索时忽略大小写
set ignorecase
" 随着键入即时搜索
set incsearch
" 有一个或以上大写字母时仍大小写敏感
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise

" 代码折叠
set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=indent
set foldlevel=99

"Smart indent
set smartindent
set autoindent    " always set autoindenting on
" never add copyindent, case error   " copy the previous indentation on autoindenting

set tabstop=2                " 设置Tab键的宽度        [等同的空格个数]
set shiftwidth=2  " number of spaces to use for autoindenting
set softtabstop=2             " 按退格键时可以一次删掉 4 个空格
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格

set expandtab                " 将Tab自动转化成空格    [需要输入真正的Tab键时，使用 Ctrl+V + Tab]

set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'

set showcmd
" A buffer becomes hidden when it is abandoned
set hidden
set wildmode=list:longest
set ttyfast


"行号变成相对，可以用 nj  nk   进行跳转 5j   5k 上下跳5行
" set relativenumber
" au FocusLost * :set number
" au FocusGained * :set relativenumber
" " 插入模式下用绝对行号, 普通模式下用相对
" autocmd InsertEnter * :set number
" autocmd InsertLeave * :set relativenumber
" function! NumberToggle()
"   if(&relativenumber == 1)
"     set number
"   else
"     set relativenumber
"   endif
" endfunc
" nnoremap <C-n> :call NumberToggle()<cr>

"create undo file
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
if v:version >= 730
" set undofile                " keep a persistent backup file
    set undodir=~/bak/vimundo/
endif

set wildignore=*.swp,*.bak,*.pyc,*.class

"显示当前的行号列号：
set ruler
""在状态栏显示正在输入的命令
set showcmd
" Show current mode
set showmode

" Set 7 lines to the cursor - when moving vertically using j/k 上下滚动,始终在中间
set scrolloff=7

"set winwidth=79

" 命令行（在状态行下）的高度，默认为1，这里是2
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
" Always show the status line
set laststatus=2

"==========================================
" file encode, 文件编码,格式
"==========================================
" 设置新文件的编码为 UTF-8
"set fileencodings=ucs-bom,utf-8,gb2312,big5,latin1

set encoding=utf-8
" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn
"language message zh_CN.UTF-8
"set langmenu=zh_CN.UTF-8
"set enc=2byte-gb18030
" 下面这句只影响普通模式 (非图形界面) 下的 Vim。
set termencoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" 如遇Unicode值大于255的文本，不必等到空格再折行。
set formatoptions+=m
" 合并两行中文时，不在中间加空格：
set formatoptions+=B

"==========================================
" others 其它配置
"==========================================
autocmd! bufwritepost .vimrc source % " vimrc文件修改之后自动加载。 linux。

" 自动补全配置
"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
"set completeopt+=longest
set completeopt=longest,menu
 
"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
 
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

" 增强模式中的命令行自动完成操作
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.class

" Python 文件的一般设置，比如不要 tab 等
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai

" if this not work ,make sure .viminfo is writable for you
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"删除多余空格
" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

" Remember info about open buffers on close"
set viminfo^=%

" For regular expressions turn magic on
set magic

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
" set whichwrap+=<,>,h,l

set noshowmode

"==========================================
"hot key  自定义快捷键
"==========================================
let mapleader = ','


let g:mapleader = ','

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nmap <C-N> :tabnext<CR>
nmap <C-P> :tabprevious<CR>

"强迫自己用 hjkl
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

"Treat long lines as break lines (useful when moving around in them)
"se swap之后，同物理行上线直接跳
map j gj
map k gk

" better command line editing
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

"Smart way to move between windows 分屏窗口移动
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Go to home and end using capitalized directions
noremap H 0
noremap L $

" Remap VIM 0 to first non-blank character
map 0 ^

" Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

""为方便复制，用<F2>开启/关闭行号显示:
nnoremap <F2> :set nonumber! number?<CR>
nnoremap <F3> :set list! list?<CR>
nnoremap <F4> :set wrap! wrap?<CR>
              "set paste
set pastetoggle=<F5>            " when in insert mode, press <F2> to go to
                                "    paste mode, where you can paste mass data
                                "    that won't be autoindented

" disbale paste mode when leaving insert mode
au InsertLeave * set nopaste

nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>


" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
"map <c-space> ?"

map Y y$
"cmap w!! %!sudo tee > /dev/null %
" w!! to sudo & write a file
cmap w!! w !sudo tee >/dev/null %
noremap <silent><leader>/ :nohls<CR>

inoremap kj <Esc>
" I can type :help on my own, thanks.
noremap <F1> <Esc>"

nnoremap <leader>v V`}

"Use sane regexes"
nnoremap / /\v
vnoremap / /\v

"Keep search pattern at the center of the screen."
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

"Use arrow key to change buffer"
noremap <left> :bp<CR>
noremap <right> :bn<CR>

""Jump to start and end of line using the home row keys
""
nmap t o<ESC>k
nmap T O<ESC>j

" ctrl +jk to move lines   经常敲错换错行...一直没想好配哪个映射
"noremap <C-k> :m+<CR>
"noremap <C-j> :m-2<CR>
"inoremap <C-j> <Esc>:m+<CR>
"inoremap <C-k> <Esc>:m-2<CR>

" Quickly close the current window
nnoremap <leader>q :q<CR>

" Swap implementations of ` and ' jump to markers
" By default, ' jumps to the marked line, ` jumps to the marked line and
" column, so swap them
nnoremap ' `
nnoremap ` '

" Use ,d (or ,dd or ,dj or 20,dd) to delete a line without adding it to the
" yanked stack (also, in visual mode)
"nnoremap <silent> <leader>d "_d
"vnoremap <silent> <leader>d "_d

" remap U to <C-r> for easier redo
nnoremap U <C-r>

"au VimResized * exe "normal! \<c-w>=""

" select all
map <Leader>sa ggVG"

" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc

" Close the current buffer
"map <leader>bd :Bclose<cr>
"" " Close all the buffers
"map <leader>ba :1,1000 bd!<cr>

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" tabnext  tabpreviouse

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

syntax on
" set background=dark
" let g:solarized_contrast='low'
let g:lightline = {
  \ 'colorscheme': 'solarized',
  \ }
colorscheme solarized

let javascript_enable_domhtmlcss=1

" syntax on
" set background=dark
" colorscheme mango

"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.

"See help completion for source,
"Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
"Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
function! Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
    endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words"

" node dict
au FileType javascript set dictionary+=$HOME/.vim/dict/node.dict
