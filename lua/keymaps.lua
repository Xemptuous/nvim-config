local function map(modes, lhs, rhs, opts)
    if type(modes) == "string" then modes = { modes } end

    for _, mode in ipairs(modes) do
        vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
    end
end

map("i", "<Esc>", 'col(\'.\') == 1 ? "<Esc>" : "<Esc>l"', { expr = true, noremap = true, silent = true, desc = "Better Escape" })
map("x", "g/", "<esc>/\\%V", { silent = false, desc = "Search Inside Visual Selection" })

map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, noremap = true, desc = "Better Movement (Down)" })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, noremap = true, desc = "Better Movement (Down)" })

-- Normals
map("n", "<C-h>", "<C-w>h", { noremap = true, desc = "Switch Window (Left)" })
map("n", "<C-j>", "<C-w>j", { noremap = true, desc = "Switch Window (Down)" })
map("n", "<C-k>", "<C-w>k", { noremap = true, desc = "Switch Window (Up)" })
map("n", "<C-l>", "<C-w>l", { noremap = true, desc = "Switch Window (Right)" })
map("n", "<Left>", "<C-w>h", { noremap = true, desc = "Switch Window (Left)" })
map("n", "<Down>", "<C-w>j", { noremap = true, desc = "Switch Window (Down)" })
map("n", "<Up>", "<C-w>k", { noremap = true, desc = "Switch Window (Up)" })
map("n", "<Right>", "<C-w>l", { noremap = true, desc = "Switch Window (Right)" })

-- Terminal
map("n", "\\t", ":terminal<CR>", {})
map("t", "<esc>", "<C-\\><C-N>", { silent = true })
map("t", "<C-h>", "<C-\\><C-N><C-w>h", { noremap = true, silent = true })
map("t", "<C-j>", "<C-\\><C-N><C-w>j", { noremap = true, silent = true })
map("t", "<C-k>", "<C-\\><C-N><C-w>k", { noremap = true, silent = true })
map("t", "<C-l>", "<C-\\><C-N><C-w>l", { noremap = true, silent = true })

map("n", "<A-h>", "<cmd>bprevious<cr>", { noremap = true, desc = "Switch Tab Prev" })
map("n", "<A-j>", "<cmd>bprevious<cr>", { noremap = true, desc = "Switch Tab Prev" })
map("n", "<A-l>", "<cmd>bnext<cr>", { noremap = true, desc = "Switch Tab Next" })
map("n", "<A-k>", "<cmd>bnext<cr>", { noremap = true, desc = "Switch Tab Next" })

map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

map("v", "<", "<gv", { noremap = true, desc = "Better Indent (Left)" })
map("v", ">", ">gv", { noremap = true, desc = "Better Indent (Right)" })

map("n", "<C-n>", ":cn<CR>", { desc = "Quickfix Next" })
map("n", "<C-p>", ":cp<CR>", { desc = "Quickfix Prev" })

map("n", "\\w", "<cmd>lua vim.opt_local.wrap = not vim.opt_local.wrap:get()<CR>", { desc = "Toggle Linewrap" })
map("n", "\\i", "<cmd>lua vim.opt_local.ignorecase = not vim.opt_local.ignorecase:get()<CR>", { desc = "Toggle Ignorecase" })
map("n", "\\s", "<cmd>lua vim.opt_local.hlsearch = not vim.opt_local.hlsearch:get()<CR>", { desc = "Toggle HighlightSearch" })
map("n", "\\r", "<cmd>lua vim.opt_local.relativenumber = not vim.opt_local.relativenumber:get()<CR>", { desc = "Toggle RelativeLine" })

-- LSP
local currentVirtualLineToggle = function()
    local cur = vim.diagnostic.config().virtual_lines
    if cur == nil or cur == false or cur == true then
        vim.diagnostic.config({ virtual_lines = { current_line = true } })
    else
        vim.diagnostic.config({ virtual_lines = not vim.diagnostic.config().virtual_lines })
    end
end
local virtualLineToggle = function() vim.diagnostic.config({ virtual_lines = not vim.diagnostic.config().virtual_lines }) end

vim.keymap.set("n", "K", function() vim.lsp.buf.hover({ border = "single" }) end, {})
vim.keymap.set("n", "\\c", currentVirtualLineToggle, {})
vim.keymap.set("n", "\\v", virtualLineToggle, { desc = "Toggle Virtual Lines" })
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", {})
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", {})
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", {})
vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", {})
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", {})
vim.keymap.set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", {})
vim.keymap.set("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>", {})
vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", {})
vim.keymap.set("x", "<F4>", "<cmd>lua vim.lsp.buf.range_code_action()<cr>", {})
vim.keymap.set("n", "<leader>v", "<cmd>lua vim.diagnostic.open_float()<cr>", { desc = "Current Line Diagnostics" })
vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", {})
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", {})
vim.keymap.set("n", "<leader>B", "<cmd>lua vim.diagnostic.setloclist()<cr>", {})
vim.keymap.set("n", "<leader>W", "<cmd>lua vim.diagnostic.setqflist()<cr>", {})
