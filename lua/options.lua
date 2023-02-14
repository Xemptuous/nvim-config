local opt = vim.opt
local g = vim.g
-- Disabling builtin explorer
opt.shadafile = ""
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
vim.g.db_ui_use_nerd_fonts = 1
-- for highlight group enabling
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
opt.smartindent = true -- makes indenting smart
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
-- vim.cmd("let g:db_ui_use_nerd_fonts = 1")

-- Disable Newline Comment Continuation
vim.cmd([[
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
]])

vim.cmd [[highlight CursorLineNr guifg=#4fa6ed gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#313640 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineContextChar guifg=#4fa6ed gui=nocombine]]

-- disable some builtin vim plugins
local default_plugins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "tutor",
  "rplugin",
  "syntax",
  "synmenu",
  "optwin",
  "compiler",
  "bugreport",
  "ftplugin",
}

for _, plugin in pairs(default_plugins) do
  g["loaded_" .. plugin] = 1
end

local default_providers = {
  "node",
  "perl",
  "python3",
  "ruby",
}

for _, provider in ipairs(default_providers) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end
