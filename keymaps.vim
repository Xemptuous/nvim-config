"NERDTree keymaps
" nnoremap <C-n> :NERDTree<CR>
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

nnoremap <F8> :TagbarToggle<CR>

nnoremap <A-t> :ToggleTerm<CR>
tnoremap <A-t> :ToggleTerm<CR>
"Enter inserts new line
nnoremap <CR> o<Esc>

" Easy CAPS
inoremap <C-u> <Esc>viwUi
nnoremap <C-u> viwU<Esc>

" Escape Alternative
inoremap jk <Esc>
inoremap kj <Esc>

"TAB movement to buffers
nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>

"Ctrl-c instead of Escape
nnoremap <C-c> <Esc>

"TAB Completion
" inoremap <expr> <Tab> cmp.visible() ? cmp.select_next_item() : "<Tab>"
" inoremap <Down> <C-R>=pumvisible() ? "\<lt>C-N>" : "\<lt>Down>"<CR>

"Better indentation
vnoremap < <gv
vnoremap > >gv

"Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <Esc> <C-\><C-n>
inoremap <S-TAB> <C-d>
