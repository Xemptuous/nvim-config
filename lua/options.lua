local opt = vim.opt
local g = vim.g
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
vim.g.db_ui_use_nerd_fonts = 1
opt.termguicolors = true
opt.ignorecase = true
opt.ignorecase = true -- ignore search case-sensitivity
opt.smartcase = true -- if atleast 1 search pattern is uppercase, enters case-sensitive
opt.incsearch = true -- incremental serach as characters added 
opt.hlsearch = true -- highlights all found search items
opt.number = true -- show line numbers
opt.relativenumber = true -- show relative line numbers
opt.cursorline = true
opt.cursorlineopt = 'number'
opt.autoindent = true -- autoindent new lines
opt.smartindent = false -- makes indenting smart
opt.smarttab = true-- tabs will consider width
opt.expandtab = true -- converts tabs to spaces
opt.tabstop = 2 -- number of spaces per tab
opt.shiftwidth = 2 -- number of spaces inserted for indentation
opt.softtabstop = 2
opt.mouse = 'a' -- enable mouse functionality
opt.hidden = true -- multiple buffers
opt.ruler = true -- always show cursor position
opt.splitbelow = true -- always split horizontal below
opt.splitright = true -- always split vertical right
opt.laststatus = 0 -- always show status line

-- Disable Newline Comment Continuation
vim.api.nvim_create_autocmd('FileType', {
  pattern = "*",
  command = "setlocal formatoptions-=c formatoptions-=r formatoptions -=o"
})

-- Highlight xrdb as xdefaults
vim.api.nvim_create_autocmd({'FileType', 'BufNewFile', 'BufEnter'}, {
  desc = 'Format xrdb files as xdefaults',
  pattern = '*.xrdb',
  command = "setfiletype xdefaults"
})

-- vim.cmd [[highlight CursorLineNr guifg=#4fa6ed gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent1 guifg=#313640 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineContextChar guifg=#4fa6ed gui=nocombine]]

