local o = vim.opt
local g = vim.g

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
vim.g.db_ui_use_nerd_fonts = 1

o.autoindent = true -- autoindent new lines
o.autoread = true
o.backup = false
o.breakindent = true
o.cindent = true
-- o.clipboard = "unnamedplus"
o.completeopt = "menuone,noinsert,noselect"
o.cursorline = true
-- o.listchars = "tab:> ,extends:…,precedes:…,nbsp:␣"
o.list = false
o.cursorlineopt = "number"
o.expandtab = true -- converts tabs to spaces
-- o.fillchars = "eob: "
o.formatoptions = "qjl1"
o.guicursor = "i:block"
o.hidden = true -- multiple buffers
o.hlsearch = true -- highlights all found search items
o.ignorecase = true
o.ignorecase = true -- ignore search case-sensitivity
o.incsearch = true -- incremental serach as characters added
o.infercase = true
o.laststatus = 0 -- always show status line
o.lazyredraw = false
o.linebreak = true
o.mouse = "a" -- enable mouse functionality
o.number = true -- show line numbers
o.pumblend = 10
o.pumheight = 10
o.relativenumber = true -- show relative line numbers
o.ruler = true -- always show cursor position
o.scrolloff = 5
o.shiftwidth = 4 -- number of spaces inserted for indentation
o.shortmess:append("WcC")
o.showmode = false
o.smartcase = true -- if atleast 1 search pattern is uppercase, enters case-sensitive
o.smartindent = true -- makes indenting smart
o.smarttab = true -- tabs will consider width
o.softtabstop = 4
o.splitbelow = true -- always split horizontal below
o.splitkeep = "screen"
o.splitright = true -- always split vertical right
o.tabstop = 4 -- number of spaces per tab
o.termguicolors = true
o.undofile = true
-- o.updatetime = 200
o.virtualedit = "block"
o.winblend = 10
o.wrap = true
o.writebackup = false

-- Disable Newline Comment Continuation
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    command = "setlocal formatoptions-=c formatoptions-=r formatoptions -=o",
})

-- -- Highlight xrdb as xdefaults
-- vim.api.nvim_create_autocmd({ "FileType", "BufNewFile", "BufEnter" }, {
--     desc = "Format xrdb files as xdefaults",
--     pattern = "*.xrdb",
--     command = "setfiletype xdefaults",
-- })
--
-- -- Highlight sqlfluff config
-- vim.api.nvim_create_autocmd({ "FileType", "BufNewFile", "BufEnter" }, {
--     desc = "Set sqlfluff file ft syntax",
--     pattern = "*.sqlfluff",
--     command = "setfiletype toml",
-- })
