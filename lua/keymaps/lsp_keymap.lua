local k = vim.api.nvim_set_keymap
local d = vim.diagnostic
local b = vim.lsp.buf
local opts = { noremap = true, silent = true }
-- k('n', '<space>e', d.open_float, opts)
k("n", "[d", d.goto_prev, opts)
k("n", "]d", d.goto_next, opts)
k("n", "<space>q", d.setloclist, opts)
local on_attach = function(client, bufnr)
	-- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	-- k('n', 'gD', b.declaration, bufopts)
	-- k('n', 'gd', b.definition, bufopts)
	-- k('n', 'K', b.hover, bufopts)
	k("n", "gi", b.implementation, bufopts)
	k("n", "<space><C-k>", b.signature_help, bufopts)
	k("n", "<space>wa", b.add_workspace_folder, bufopts)
	k("n", "<space>wr", b.remove_workspace_folder, bufopts)
	k("n", "<space>wl", function()
		print(vim.inspect(b.list_workspace_folders()))
	end, bufopts)
	k("n", "<space>D", b.type_definition, bufopts)
	k("n", "<space>rn", b.rename, bufopts)
	k("n", "<space>ca", b.code_action, bufopts)
	-- k('n', 'gr', b.references, bufopts)
	k("n", "<space>f", function()
		b.format({ async = true })
	end, bufopts)
end
return on_attach
