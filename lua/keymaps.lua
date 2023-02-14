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

--[ Plugin Keybinds ]

-- Nvim-Tree
k('n', '<C-t>', [[:NvimTreeToggle<CR>]], {})
k('n', '<C-n>', [[:NvimTreeFocus<CR>]], {})
k('n', '<F9>', [[:TagbarToggle<CR>]], {})

-- Telescope
local builtin = require('telescope.builtin')
k('n', '<leader>tf', builtin.find_files, {})
k('n', '<leader>tg', builtin.live_grep, {})
k('n', '<leader>tb', builtin.buffers, {})
k('n', '<leader>th', builtin.help_tags, {})
k('n', '<leader>tR', builtin.oldfiles, {})
k('n', '<leader>tw', builtin.grep_string, {})
k('n', '<leader>tH', builtin.search_history, {})
k('n', '<leader>tC', builtin.command_history, {})
k('n', '<leader>tc', builtin.colorscheme, {})
k('n', '<leader>tr', builtin.registers, {})
-- k('n', '<leader>m', [[:lua require'telescope.builtin'.marks{}<CR>]])

-- ToggleTerm
k('t', '<A-t>', [[exit<CR>]])
k('t', '<A-v>', [[exit<CR>]])
k('t', '2<A-t>', [[<C-\><C-N>:ToggleTermToggleAll<CR>]])
k('n', '<A-t>', [[:ToggleTerm size=12 direction=horizontal<CR>]])
k('n', '<A-v>', [[:ToggleTerm size=40 direction=vertical<CR>]])
k('n', '2<A-t>', [[:ToggleTerm size=12 direction=horizontal<CR><C-\><C-N>:2ToggleTerm<CR>]])
function _G.set_terminal_keymaps()
    local opts = {buffer = 0}
    k('t', '<esc>', [[exit<CR>]], opts)
    -- k('t', 'jk', [[exit<CR>]], opts)
    k('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    k('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    k('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    k('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- LazyGit
k('n', '<leader>g', [[:LazyGit<CR>]], {})

-- DAP
k('n', '<Leader>d<F5>', function() require('dap').continue() end)
k('n', '<Leader>d<F6>', function() require('dap').step_over() end)
k('n', '<Leader>d<F7>', function() require('dap').step_into() end)
k('n', '<Leader>d<F8>', function() require('dap').step_out() end)
k('n', '<Leader>db', function() require('dap').toggle_breakpoint() end)
k('n', '<Leader>dr', function() require('dap').repl.open() end)
k('n', '<Leader>dl', function() require('dap').run_last() end)
k({'n', 'v'}, '<Leader>dh', function()
require('dap.ui.widgets').hover()
end)
k({'n', 'v'}, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end)
k('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
k('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)

-- CMP
-- LSP
local opts = { noremap=true, silent=true }
k('n', '<space>e', vim.diagnostic.open_float, opts)
k('n', '[d', vim.diagnostic.goto_prev, opts)
k('n', ']d', vim.diagnostic.goto_next, opts)
k('n', '<space>q', vim.diagnostic.setloclist, opts)
local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    k('n', 'gD', vim.lsp.buf.declaration, bufopts)
    k('n', 'gd', vim.lsp.buf.definition, bufopts)
    k('n', 'K', vim.lsp.buf.hover, bufopts)
    k('n', 'gi', vim.lsp.buf.implementation, bufopts)
    k('n', '<space><C-k>', vim.lsp.buf.signature_help, bufopts)
    k('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    k('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    k('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    k('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    k('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    k('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    k('n', 'gr', vim.lsp.buf.references, bufopts)
    k('n', '<space>f',function() vim.lsp.buf.format { async = true } end, bufopts)
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

