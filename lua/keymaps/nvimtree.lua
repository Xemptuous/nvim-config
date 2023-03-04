local k = vim.api.nvim_set_keymap
k('n', '<C-t>', [[:NvimTreeToggle<CR>]], {})
k('n', '<C-n>', [[:NvimTreeFocus<CR>]], {})
k('n', '<F9>', [[:TagbarToggle<CR>]], {})
