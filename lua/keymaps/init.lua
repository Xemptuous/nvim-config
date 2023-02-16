local k = vim.keymap.set
k('n', '<CR>', [[o<Esc>]], {})
k('n', '<TAB>', [[:bnext<CR>]], {})
k('n', '<S-TAB>', [[:bprevious<CR>]], {})

k('n', '<C-c>', [[<Esc>]], {})
k('i', 'jk', [[<Esc>]], {})
k('i', 'kj', [[<Esc>]], {})
k('v', 'q', [[<Esc>]], {})

k('n', '<C-h>', [[<C-w>h]], {})
k('n', '<C-j>', [[<C-w>j]], {})
k('n', '<C-k>', [[<C-w>k]], {})
k('n', '<C-l>', [[<C-w>l]], {})

k('v', '<', [[<gv]], {})
k('v', '>', [[>gv]], {})

k('n', 'x', [["_x]], {})
k('n', 'X', [["_X]], {})
