local lsp = require("lspconfig")
lsp.bashls.setup({})
lsp.clangd.setup({})
lsp.jdtls.setup({ cmd = { vim.fn.stdpath("data") .. "/mason/bin/jdtls" }, })
lsp.html.setup({})
lsp.pylsp.setup({})
lsp.sqlls.setup({})
lsp.vimls.setup({})
lsp.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	underline = true,
	severity_sort = true,
	update_in_insert = false,
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	update_in_insert = false,
})
