-- Disabling builtin explorer
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- for highlight group enabling
vim.opt.termguicolors = true
vim.opt.ignorecase = true


vim.api.nvim_set_option('ignorecase', true) -- ignore search case-sensitivity
vim.api.nvim_set_option('smartcase', true) -- if atleast 1 search pattern is uppercase, enters case-sensitive
vim.api.nvim_set_option('incsearch', true) -- incremental serach as characters added 
vim.api.nvim_set_option('hlsearch', true) -- highlights all found search items
vim.api.nvim_win_set_option(0, 'number', true) -- show line numbers
vim.api.nvim_win_set_option(0, 'relativenumber', true) -- show relative line numbers
vim.api.nvim_win_set_option(0, 'cursorline', true)
vim.api.nvim_win_set_option(0, 'cursorlineopt', 'number')
vim.api.nvim_set_option('autoindent', true) -- autoindent new lines
vim.api.nvim_set_option('smartindent', true) -- makes indenting smart
vim.api.nvim_set_option('smarttab', true)-- tabs will consider width
vim.api.nvim_set_option('expandtab', true) -- converts tabs to spaces
vim.api.nvim_buf_set_option(0, 'tabstop', 2) -- number of spaces per tab
vim.api.nvim_buf_set_option(0, 'shiftwidth', 2) -- number of spaces inserted for indentation
vim.api.nvim_buf_set_option(0, 'softtabstop', 2)
vim.api.nvim_set_option('mouse', 'a') -- enable mouse functionality
vim.api.nvim_set_option('hidden', true) -- multiple buffers
vim.api.nvim_set_option('ruler', true) -- always show cursor position
vim.api.nvim_set_option('splitbelow', true) -- always split horizontal below
vim.api.nvim_set_option('splitright', true) -- always split vertical right
vim.api.nvim_set_option('laststatus', 0) -- always show status line
-- vim.api.nvim_set_option('cinoptions', 'l1,^-2,:2,(2,W2') -- check :help cinoptions-values
-- vim.api.nvim_set_option('cursorline -- highlights current line
-- vim.api.nvim_set_option('clipboard=unnamedplus -- outer register
-- vim.api.nvim_set_option('colorcolumn=80 -- character-count helper lines

vim.cmd("let g:db_ui_use_nerd_fonts = 1")

-- Disable Newline Comment Continuation
vim.cmd([[
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
]])

vim.api.nvim_set_hl(0, 'FloatBorder', {fg = '#4fa6ed', bg='#151820'}) -- coloring for codewindow
vim.api.nvim_set_hl(0, 'NormalFloat', {fg = '#4fa6ed', bg='#151820'}) -- coloring for codewindow
vim.api.nvim_set_hl(0, 'CodewindowBorder', {fg = '#4fa6ed'})
vim.api.nvim_set_hl(0, 'CodewindowBackground', {fg = '#4fa6ed'})
vim.cmd [[highlight CursorLineNr guifg=#4fa6ed gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#313640 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineContextChar guifg=#4fa6ed gui=nocombine]]

local disabled_built_ins = {
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"logipat",
	"rrhelper",
	"spellfile_plugin",
	"matchit"
}

for _, plugin in pairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end
