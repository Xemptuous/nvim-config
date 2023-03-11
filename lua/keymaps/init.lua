local k = vim.api.nvim_set_keymap
k('n', '<CR>', [[o<Esc>]], {noremap = true})
k('n', '<TAB>', [[:bnext<CR>]], {noremap = true})
k('n', '<S-TAB>', [[:bprevious<CR>]], {noremap = true})

k('n', '<C-c>', [[<Esc>]], {noremap = true})
k('i', 'jk', [[<Esc>]], {noremap = true})
k('i', 'kj', [[<Esc>]], {noremap = true})
k('v', 'q', [[<Esc>]], {noremap = true})

k('n', '<C-h>', [[<C-w>h]], {noremap = true})
k('n', '<C-j>', [[<C-w>j]], {noremap = true})
k('n', '<C-k>', [[<C-w>k]], {noremap = true})
k('n', '<C-l>', [[<C-w>l]], {noremap = true})

k('v', '<', [[<gv]], {noremap = true})
k('v', '>', [[>gv]], {noremap = true})

k('n', 'x', [["_x]], {noremap = true})
k('n', 'X', [["_X]], {noremap = true})

-- Fix for Xterm
k('i', "<S-{>", '{', {noremap = false})
