set ignorecase " ignore search case-sensitivity
set smartcase " if atleast 1 search pattern is uppercase, enters case-sensitive
set incsearch " incremental serach as characters added 
set hlsearch " highlights all found search items

set number " show line numbers
set relativenumber " show relative line numbers
set autoindent " autoindent new lines
set smartindent " makes indenting smart
set smarttab " tabs will consider width
set expandtab " converts tabs to spaces

set tabstop=2 " number of spaces per tab
set shiftwidth=2 " number of spaces inserted for indentation
set softtabstop=2
set mouse=a " enable mouse functionality

set hidden " multiple buffers
set ruler " always show cursor position
set splitbelow " always split horizontal below
set splitright " always split vertical right
set laststatus=0 " always show status line
" set cursorline " highlights current line
" set clipboard=unnamedplus " outer register

" set colorcolumn=80 " character-count helper lines

" Disable Newline Comment Continuation
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set cinoptions=l1,^-2,:2,(0,W2, " check :help cinoptions-values
