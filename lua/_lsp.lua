local on_attach = require('keymaps')

require("nvim-lsp-installer").setup {}
-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local nvim_lsp = require('lspconfig')

nvim_lsp['bashls'].setup {
    on_attach = on_attach,
    capabilities = capabilities
}
nvim_lsp['clangd'].setup {
    on_attach = on_attach,
    capabilities = capabilities
}
nvim_lsp['cssls'].setup {
    on_attach = on_attach,
    capabilities = capabilities
}
nvim_lsp['html'].setup {
    on_attach = on_attach,
    capabilities = capabilities
}
nvim_lsp['pyright'].setup {
    on_attach = on_attach,
    capabilities = capabilities
}
nvim_lsp['jdtls'].setup {
    on_attach = on_attach,
    capabilities = capabilities
}
nvim_lsp['quick_lint_js'].setup {
    on_attach = on_attach,
    capabilities = capabilities
}
nvim_lsp['sumneko_lua'].setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = {'vim'},
            },
        },
    },
    on_attach = on_attach,
    capabilities = capabilities
}
nvim_lsp['vimls'].setup {
    on_attach = on_attach,
    capabilities = capabilities
}

-- disabling certain hint-level diagnostics
function filter(arr, func)
	-- Filter in place
	-- https://stackoverflow.com/questions/49709998/how-to-filter-a-lua-array-inplace
	local new_index = 1
	local size_orig = #arr
	for old_index, v in ipairs(arr) do
		if func(v, old_index) then
			arr[new_index] = v
			new_index = new_index + 1
		end
	end
	for i = new_index, size_orig do arr[i] = nil end
end


function filter_diagnostics(diagnostic)
	-- Only filter out Pyright stuff for now
	if diagnostic.source ~= "Pyright" then
		return true
	end

	-- Allow kwargs to be unused, sometimes you want many functions to take the
	-- same arguments but you don't use all the arguments in all the functions,
	-- so kwargs is used to suck up all the extras
	if diagnostic.message == '"kwargs" is not accessed' then
		return false
	end

	-- Allow variables starting with an underscore
	if string.match(diagnostic.message, '"_.+" is not accessed') then
		return false
	end

  -- Django related fixes
  if string.match(diagnostic.message, 'Cannot access member "objects" for type') then
    return false
  end

	return true
end

function custom_on_publish_diagnostics(a, params, client_id, c, config)
	filter(params.diagnostics, filter_diagnostics)
	vim.lsp.diagnostic.on_publish_diagnostics(a, params, client_id, c, config)
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	custom_on_publish_diagnostics, {})

