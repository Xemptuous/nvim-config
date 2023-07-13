require("lspsaga").setup({
	ui = {
		title = false,
		border = "rounded",
	},
	lightbulb = {
		enable = false,
	},
	diagnostic = {
		on_insert = false,
	},
})
local k = vim.api.nvim_set_keymap
k("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", {})

k("n", "gr", "<cmd>Lspsaga rename<CR>", {})
k("n", "gR", "<cmd>Lspsaga rename ++project<CR>", {})

k("n", "gd", "<cmd>Lspsaga peek_definition<CR>", {})
k("n", "gD", "<cmd>Lspsaga goto_definition<CR>", {})

k("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>", {})
k("n", "gT", "<cmd>Lspsaga goto_type_definition<CR>", {})

k("n", "<space>v", "<cmd>Lspsaga show_line_diagnostics<CR>", {})
k("n", "<space>e", "<cmd>Lspsaga show_cursor_diagnostics<CR>", {})
k("n", "<space>b", "<cmd>Lspsaga show_buf_diagnostics<CR>", {})

local vd = vim.diagnostic.severity.ERROR
k("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", {})
k("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", {})
vim.keymap.set("n", "[E", function()
	require("lspsaga.diagnostic"):goto_prev({ vd })
end)
vim.keymap.set("n", "]E", function()
	require("lspsaga.diagnostic"):goto_next({ vd })
end)

k("n", "<leader>o", "<cmd>Lspsaga outline<CR>", {})
k("n", "K", "<cmd>Lspsaga hover_doc<CR>", {})
k("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>", {})
k("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>", {})
k("n", "<A-t>", "<cmd>Lspsaga term_toggle<CR>", {})
k("t", "<A-t>", "<cmd>Lspsaga term_toggle<CR>", {})
