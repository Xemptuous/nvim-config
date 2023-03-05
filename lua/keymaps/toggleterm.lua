local k = vim.api.nvim_set_keymap
k('t', '<A-t>', [[exit<CR>]], {})
k('t', '<A-v>', [[exit<CR>]], {})
k('t', '2<A-t>', [[<C-\><C-N>:ToggleTermToggleAll<CR>]], {})
k('n', '<A-t>', [[:ToggleTerm size=12 direction=horizontal<CR>]], {})
k('n', '<A-v>', [[:ToggleTerm size=40 direction=vertical<CR>]], {})
k('n', '2<A-t>', [[:ToggleTerm size=12 direction=horizontal<CR><C-\><C-N>:2ToggleTerm<CR>]], {})
function _G.set_terminal_keymaps()
    local opts = {buffer = 0}
    k('t', '<esc>', [[exit<CR>]], opts)
    -- k('t', 'jk', [[exit<CR>]], opts)
    k('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    k('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    k('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    k('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end
-- vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
