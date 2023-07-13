local g = vim.g
local default_plugins = {
	"tutor",
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
	"rplugin",
	"tohtml",
	"zipPlugin",
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

-- keymaps
local k = vim.api.nvim_set_keymap
k("n", "<CR>", [[o<Esc>]], { noremap = true })
k("n", "<TAB>", [[:bnext<CR>]], { noremap = true })
k("n", "<S-TAB>", [[:bprevious<CR>]], { noremap = true })

k("n", "<C-c>", [[<Esc>]], { noremap = true })
k("i", "jk", [[<Esc>]], { noremap = true })
k("i", "kj", [[<Esc>]], { noremap = true })
k("v", "q", [[<Esc>]], { noremap = true })

k("n", "<C-h>", [[<C-w>h]], { noremap = true })
k("n", "<C-j>", [[<C-w>j]], { noremap = true })
k("n", "<C-k>", [[<C-w>k]], { noremap = true })
k("n", "<C-l>", [[<C-w>l]], { noremap = true })

k("v", "<", [[<gv]], { noremap = true })
k("v", ">", [[>gv]], { noremap = true })

k("n", "x", [["_x]], { noremap = true })
k("n", "X", [["_X]], { noremap = true })
k("i", "<S-{>", "{", { noremap = false })

-- options
local opt = vim.opt
local g = vim.g
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
vim.g.db_ui_use_nerd_fonts = 1
opt.termguicolors = false
opt.ignorecase = true
opt.ignorecase = true -- ignore search case-sensitivity
opt.smartcase = true -- if atleast 1 search pattern is uppercase, enters case-sensitive
opt.incsearch = true -- incremental serach as characters added
opt.hlsearch = true -- highlights all found search items
opt.number = true -- show line numbers
opt.relativenumber = true -- show relative line numbers
opt.cursorline = true
opt.cursorlineopt = "number"
opt.autoindent = true -- autoindent new lines
opt.smartindent = false -- makes indenting smart
opt.smarttab = true -- tabs will consider width
opt.expandtab = true -- converts tabs to spaces
opt.tabstop = 2 -- number of spaces per tab
opt.shiftwidth = 2 -- number of spaces inserted for indentation
opt.softtabstop = 2
opt.mouse = "a" -- enable mouse functionality
opt.hidden = true -- multiple buffers
opt.ruler = true -- always show cursor position
opt.splitbelow = true -- always split horizontal below
opt.splitright = true -- always split vertical right
opt.laststatus = 0 -- always show status line

-- Disable Newline Comment Continuation
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	command = "setlocal formatoptions-=c formatoptions-=r formatoptions -=o",
})

-- Highlight xrdb as xdefaults
vim.api.nvim_create_autocmd({ "FileType", "BufNewFile", "BufEnter" }, {
	desc = "Format xrdb files as xdefaults",
	pattern = "*.xrdb",
	command = "setfiletype xdefaults",
})

package.path = "./lua/?.lua;" .. package.path
require("vi_init")
