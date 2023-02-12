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
vim.keymap.set('n', '<F9>', [[:TagbarToggle<CR>]], {})

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>tf', builtin.find_files, {})
vim.keymap.set('n', '<leader>tg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>tb', builtin.buffers, {})
vim.keymap.set('n', '<leader>th', builtin.help_tags, {})
vim.keymap.set('n', '<leader>tR', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>tw', builtin.grep_string, {})
vim.keymap.set('n', '<leader>tH', builtin.search_history, {})
vim.keymap.set('n', '<leader>tC', builtin.command_history, {})
vim.keymap.set('n', '<leader>tc', builtin.colorscheme, {})
vim.keymap.set('n', '<leader>tr', builtin.registers, {})
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
vim.keymap.set('n', '<leader>g', [[:LazyGit<CR>]], {})

-- DAP
local dap_builtin = 
vim.keymap.set('n', '<Leader>d<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<Leader>d<F6>', function() require('dap').step_over() end)
vim.keymap.set('n', '<Leader>d<F7>', function() require('dap').step_into() end)
vim.keymap.set('n', '<Leader>d<F8>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>db', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end)
vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)

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

local wk = require("which-key")
wk.register({
  ["<leader>"] = {
    t = {
      name = "Telescope",
      f = { "<cmd>Telescope find_files<cr>", "Find File" },
      g = { "<cmd>Telescope live_grep<cr>", 'Grep' },
      b = { "<cmd>Telescope buffers<cr>", 'Buffers' },
      h = { "<cmd>Telescope help_tags<cr>", 'Help' },
      R = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
      w = { "<cmd>Telescope grep_string{}<CR>", "String" },
      H = { "<cmd>Telescope search_history{}<CR>", "Search History" },
      C = { "<cmd>Telescope command_history{}<CR>", "Command History" },
      c = { "<cmd>Telescope colorscheme{}<CR>", "Colorscheme" },
      r = { "<cmd>Telescope registers{}<CR>", "Registers" },
    },
    d = {
      name = "Debugger",
      ["<F5>"] = { "<cmd>DapContinue<CR>", "Continue" },
      ["<F6>"] = { "<cmd>DapStepOver<CR>", "StepOver" },
      ["<F7>"] = { "<cmd>DapStepInto<CR>", "StepInto" },
      ["<F8>"] = { "<cmd>DapStepOut<CR>", "StepOut" },
      b = { "<cmd>DapToggleBreakpoint<CR>", "Breakpoint Toggle" },
      r = { "<cmd>DapToggleReplCR>", "REPL Toggle" },
      l = { "<cmd>:lua require('dap').run_last()", "Run Last" },
      h = { "<cmd>:lua require('dap.ui.widgets').hover()", "Show Hover Info" },
      p = { "<cmd>:lua require('dap.ui.widgets').preview()", "Show Preview" },
      f = { "<cmd>:lua widgets.centered_float(require('dap.ui.widgets').frames)", "Show Frames" },
      s = { "<cmd>:lua widgets.centered_float(require('dap.ui.widgets').scopes)", "Show Scopes" },
    },
    m = {
      name = "Code Window",
      o = {}
    }
  }
}, {
  mode = "n",
  prefix = "",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
})

return on_attach

