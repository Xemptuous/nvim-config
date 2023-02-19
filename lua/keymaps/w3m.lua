local k = vim.keymap.set

vim.cmd [[ let g:w3m#disable_default_keymap = 1 ]]
k('n', '<leader>wg', ':W3m google ')
