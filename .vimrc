" color scheme
set t_Co=256

set cursorline
set number

" encoding
set fenc=utf-8
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936

" history
set history=100

" syntax highlighting
syntax on

" indent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent
set expandtab
set nowrap

" status bar
highlight StatusLine guifg=SlateBlue guibg=Yellow
highlight StatusLineNC guifg=Gray guibg=White
set ruler
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)

" matching
set showmatch
set matchtime=5

" searching
set incsearch

" others
set confirm
set clipboard+=unnamed
filetype on
filetype plugin on

colorscheme dracula
