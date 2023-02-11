--[ Standard Keybinds ]
vim.keymap.set('n', '<CR>', [[o<Esc>]], {}) -- Enter inserts newline
vim.keymap.set('n', '<TAB>', [[:bnext<CR>]], {}) -- TAB moves to next buffer
vim.keymap.set('n', '<S-TAB>', [[:bprevious<CR>]], {}) -- Shift-Tab moves to prev buffer

    -- Escape Alternatives
vim.keymap.set('n', '<C-c>', [[<Esc>]], {})
vim.keymap.set('i', 'jk', [[<Esc>]], {})
vim.keymap.set('i', 'kj', [[<Esc>]], {})
vim.keymap.set('v', 'q', [[<Esc>]], {})

    -- Better window navigation
vim.keymap.set('n', '<C-h>', [[<C-w>h]], {})
vim.keymap.set('n', '<C-j>', [[<C-w>j]], {})
vim.keymap.set('n', '<C-k>', [[<C-w>k]], {})
vim.keymap.set('n', '<C-l>', [[<C-w>l]], {})

    -- Better indentation
vim.keymap.set('v', '<', [[<gv]], {})
vim.keymap.set('v', '>', [[>gv]], {})

    -- Removing x delete clipboard paste
vim.keymap.set('n', 'x', [["_x]], {})
vim.keymap.set('n', 'X', [["_X]], {})



--[ Plugin Keybinds ]

-- Nvim-Tree
vim.keymap.set('n', '<C-t>', [[:NvimTreeToggle<CR>]], {})
vim.keymap.set('n', '<C-n>', [[:NvimTreeFocus<CR>]], {})
vim.keymap.set('n', '<F8>', [[:TagbarToggle<CR>]], {})

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>w', [[:lua require'telescope.builtin'.grep_string{}<CR>]])
vim.keymap.set('n', '<leader>h', [[:lua require'telescope.builtin'.search_history{}<CR>]])
vim.keymap.set('n', '<leader>ch', [[:lua require'telescope.builtin'.command_history{}<CR>]])
vim.keymap.set('n', '<leader>cs', [[:lua require'telescope.builtin'.colorscheme{}<CR>]])
vim.keymap.set('n', '<leader>o', [[:lua require'telescope.builtin'.options{}<CR>]])
vim.keymap.set('n', '<leader>r', [[:lua require'telescope.builtin'.registers{}<CR>]])
-- vim.keymap.set('n', '<leader>m', [[:lua require'telescope.builtin'.marks{}<CR>]])

-- ToggleTerm
vim.keymap.set('t', '<A-t>', [[exit<CR>]])
vim.keymap.set('t', '<A-v>', [[exit<CR>]])
vim.keymap.set('t', '2<A-t>', [[<C-\><C-N>:ToggleTermToggleAll<CR>]])
vim.keymap.set('n', '<A-t>', [[:ToggleTerm size=12 direction=horizontal<CR>]])
vim.keymap.set('n', '<A-v>', [[:ToggleTerm size=40 direction=vertical<CR>]])
vim.keymap.set('n', '2<A-t>', [[:ToggleTerm size=12 direction=horizontal<CR><C-\><C-N>:2ToggleTerm<CR>]])
function _G.set_terminal_keymaps()
    local opts = {buffer = 0}
    vim.keymap.set('t', '<esc>', [[exit<CR>]], opts)
    -- vim.keymap.set('t', 'jk', [[exit<CR>]], opts)
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- LazyGit
vim.keymap.set('n', '<leader>gg', [[:LazyGit<CR>]], {})

-- CMP
-- LSP
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<space><C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f',function() vim.lsp.buf.format { async = true } end, bufopts)
end
return on_attach
