set ignorecase " ignore search case-sensitivity
set smartcase
set incsearch

set number " show line numbers
set autoindent " autoindent new lines
set smartindent " makes indenting smart
set smarttab " tabs will consider width
set expandtab " converts tabs to spaces

set tabstop=4 " number of spaces per tab
set shiftwidth=4 " number of spaces inserted for indentation
set softtabstop=4
set mouse=a " enable mouse functionality

set hidden " multiple buffers
set ruler " always show cursor position
set splitbelow " always split horizontal below
set splitright " always split vertical right
set laststatus=0 " always show status line
set cursorline " highlights current line
set clipboard=unnamedplus " copy-paste register
set colorcolumn=80,120 " character-count helper lines

" Disable Newline Comment Continuation
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

