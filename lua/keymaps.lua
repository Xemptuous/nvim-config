local function map(modes, lhs, rhs, opts)
	if type(modes) == "string" then
		modes = { modes }
	end

	for _, mode in ipairs(modes) do
		vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
	end
end

map("i", "<Esc>", 'col(\'.\') == 1 ? "<Esc>" : "<Esc>l"', { expr = true, noremap = true, silent = true })

map(
	"n",
	"\\h",
	'<Cmd>let v:hlsearch = 1 - v:hlsearch | echo (v:hlsearch ? "  " : "no") . "hlsearch"<CR>',
	{ desc = "Toggle search highlight" }
)
map("n", "\\i", "<Cmd>setlocal ignorecase! ignorecase?<CR>", { desc = "Toggle 'ignorecase'" })
map("n", "\\r", "<Cmd>setlocal relativenumber! relativenumber?<CR>", { desc = "Toggle 'relativenumber'" })
map("n", "\\w", "<Cmd>setlocal wrap! wrap?<CR>", { desc = "Toggle 'wrap'" })

map("", "<leader>bn", [[:bnext<CR>]], { noremap = true })
map("", "<leader>bp", [[:bprevious<CR>]], { noremap = true })

map("x", "g/", "<esc>/\\%V", { silent = false, desc = "Search inside visual selection" })

-- better movement
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, noremap = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, noremap = true })

-- map("n", "h", "h", { noremap = true })
-- map("n", "l", "l", { noremap = true })

-- map("n", "i", "i", { noremap = true })
-- map("n", "u", "u", { noremap = true })

map("n", "<C-c>", [[<Esc>]], { noremap = true })
map("i", "jk", [[<Esc>]], { noremap = true })
map("i", "kj", [[<Esc>]], { noremap = true })
map("v", "q", [[<Esc>]], { noremap = true })

-- switch windows
map("n", "<C-h>", "<C-w>h", { noremap = true })
map("n", "<C-j>", "<C-w>j", { noremap = true })
map("n", "<C-k>", "<C-w>k", { noremap = true })
map("n", "<C-l>", "<C-w>l", { noremap = true })
map("n", "<Left>", "<C-w>h", { noremap = true })
map("n", "<Down>", "<C-w>j", { noremap = true })
map("n", "<Up>", "<C-w>k", { noremap = true })
map("n", "<Right>", "<C-w>l", { noremap = true })

--switch tabs
-- map("n", "<S-Left>", "<cmd>tabprevious<cr>", { noremap = true })
-- map("n", "<S-Right>", "<cmd>tabnext<cr>", { noremap = true })
map("n", "<S-Left>", "<cmd>bprevious<cr>", { noremap = true })
map("n", "<S-Down>", "<cmd>bprevious<cr>", { noremap = true })
map("n", "<S-Right>", "<cmd>bnext<cr>", { noremap = true })
map("n", "<S-Up>", "<cmd>bnext<cr>", { noremap = true })

-- resize windows
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- move lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- better indent
map("v", "<", "<gv", { noremap = true })
map("v", ">", ">gv", { noremap = true })
-- map("n", "<", "<<", { noremap = true, nowait = true })
-- map("n", ">", ">>", { noremap = true, nowait = true })

-- dont save delete chars to clipboard
map("n", "x", [["_x]], { noremap = true })
map("n", "X", [["_X]], { noremap = true })

-- toggle wrap
map("n", "<leader>uw", ":set nowrap!<cr>", {})
map("n", "<leader>f", ":Format<cr>", {})

-- quickfix list
map("n", "<C-n>", ":cn<CR>", {})
map("n", "<C-p>", ":cp<CR>", {})

-- Fix for Xterm
-- removed. Instead, add to .Xresources:
-- xterm.VT100.translations: #override \
--     Shift <Key>[: string("{") \n\
--     Shift <Key>]: string("}") \n\
--     Shift <Key>-: string("_") \n\
--     Shift <Key>`: string("~") \n\
--     Shift <Key>2: string("@") \n\
--     Shift <Key>6: string("^")
-- map("i", "<S-{>", "{", { noremap = false })
-- map("i", "<S-}>", "}", { noremap = false })
