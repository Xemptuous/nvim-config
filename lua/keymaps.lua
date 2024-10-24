local k = vim.api.nvim_set_keymap

-- vim.cmd(':let mapleader = "\\<Space>"')

-- k("n", "<CR>", [[o<Esc>]], { noremap = true })
k("n", "<TAB>", [[:bnext<CR>]], { noremap = true })
k("n", "<S-TAB>", [[:bprevious<CR>]], { noremap = true })

-- better movement
k("", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
k("", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- k("n", "h", "h", { noremap = true })
-- k("n", "l", "l", { noremap = true })

-- k("n", "i", "i", { noremap = true })
-- k("n", "u", "u", { noremap = true })

k("n", "<C-c>", [[<Esc>]], { noremap = true })
k("i", "jk", [[<Esc>]], { noremap = true })
k("i", "kj", [[<Esc>]], { noremap = true })
k("v", "q", [[<Esc>]], { noremap = true })

-- switch windows
k("n", "<C-h>", "<C-w>h", { noremap = true })
k("n", "<C-j>", "<C-w>j", { noremap = true })
k("n", "<C-k>", "<C-w>k", { noremap = true })
k("n", "<C-l>", "<C-w>l", { noremap = true })
k("n", "<Left>", "<C-w>h", { noremap = true })
k("n", "<Down>", "<C-w>j", { noremap = true })
k("n", "<Up>", "<C-w>k", { noremap = true })
k("n", "<Right>", "<C-w>l", { noremap = true })

--switch tabs
k("n", "<S-Left>", "<cmd>tabprevious<cr>", { noremap = true })
k("n", "<S-Right>", "<cmd>tabnext<cr>", { noremap = true })

-- resize windows
k("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
k("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
k("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
k("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- move lines
k("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
k("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
k("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
k("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
k("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
k("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- better indent
k("v", "<", "<gv", { noremap = true })
k("v", ">", ">gv", { noremap = true })
k("n", "<", "<<", { noremap = true })
k("n", ">", ">>", { noremap = true })

-- dont save delete chars to clipboard
k("n", "x", [["_x]], { noremap = true })
k("n", "X", [["_X]], { noremap = true })

-- toggle wrap
k("n", "<leader>uw", ":set nowrap!<cr>", {})
k("n", "<leader>f", ":Format<cr>", {})

-- quickfix list
k("n", "<C-n>", ":cn<CR>", {})
k("n", "<C-p>", ":cp<CR>", {})

-- Fix for Xterm
-- removed. Instead, add to .Xresources:
-- xterm.VT100.translations: #override \
--     Shift <Key>[: string("{") \n\
--     Shift <Key>]: string("}") \n\
--     Shift <Key>-: string("_") \n\
--     Shift <Key>`: string("~") \n\
--     Shift <Key>2: string("@") \n\
--     Shift <Key>6: string("^")
-- k("i", "<S-{>", "{", { noremap = false })
-- k("i", "<S-}>", "}", { noremap = false })
