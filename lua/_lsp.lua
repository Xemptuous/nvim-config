
require("mason").setup()
require("mason-lspconfig").setup()
-- Setup lspconfig.
local lsp_flags = {
  debounce_text_changes = 150,
}
local on_attach = require('keymaps')
local lsp = require('lspconfig')
vim.lsp.set_log_level("debug")
lsp.bashls.setup {
  on_attach = on_attach,
  flags = lsp_flags,
}
lsp.clangd.setup {
  on_attach = on_attach,
  flags = lsp_flags,
}
lsp.cssls.setup {
  on_attach = on_attach,
  flags = lsp_flags,
}
lsp.html.setup {
  on_attach = on_attach,
  flags = lsp_flags,
}
lsp.jdtls.setup {
  on_attach = on_attach,
  flags = lsp_flags,
}
lsp.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = {'vim'}
      }
    }
  },
  on_attach = on_attach,
  flags = lsp_flags,
}
lsp.pyright.setup {
  on_attach = on_attach,
  flags = lsp_flags,
}
lsp.quick_lint_js.setup {
  on_attach = on_attach,
  flags = lsp_flags,
}
lsp.sqlls.setup {
  on_attach = on_attach,
  flags = lsp_flags,
}
lsp.vimls.setup {
  on_attach = on_attach,
  flags = lsp_flags,
}

-- require("mason-lspconfig").setup_handlers {
--   function (server_name)
--     lsp[server_name].setup {}
--   end,
--
--   -- Can provide dedicated handlers for specific servers:
--   -- ["base-language-server"] = function()
--   --   require("bash-language-server").setup {}
--   -- end
-- }

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

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  float = {
    border = "single",
    format = function(diagnostic)
      return string.format(
        "%s (%s) [%s]",
        diagnostic.message,
        diagnostic.source,
        diagnostic.code or diagnostic.user_data.lsp.code
      )
    end,
  },
})

local dap = require("dap")
require ('mason-nvim-dap').setup({
  automatic_setup = true,
  ensure_installed = {'cpptools', 'debugpy'}
})
require 'mason-nvim-dap'.setup_handlers {
  function(source_name)
    require('mason-nvim-dap.automatic_setup')(source_name)
  end,
  python = function(source_name)
    dap.adapters.python = {
      type = 'executable',
      command = '/home/xempt/.virtualenvs/debugpy/bin/python3',
      -- command = '/usr/bin/python3',
      args = { '-m', 'debugpy.adapter' };
      -- args = { os.getenv("HOME") .. "/.virtualenvs/debugpy/bin/python" };
    }
    dap.configurations.python = {
      {
        type = 'python',
        request = 'launch',
        name = 'Launch file',
        program = '${file}'
      }
    }
  end
}

