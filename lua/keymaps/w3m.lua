local k = vim.api.nvim_set_keymap

vim.cmd([[ let g:w3m#disable_default_keymap = 1 ]])
k("n", "<leader>wg", ":W3m google ")
