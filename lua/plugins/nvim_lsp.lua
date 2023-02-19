-- require("mason").setup()
-- require("mason-lspconfig").setup()
-- local on_attach = require('../keymaps.lsp_keymap')
local lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  client.server_capabilities.semanticTokensProvider = nil
end
-- local servers = {
--   'bashls', 'clangd', 'cssls', 'html', 'jdtls', 
--   'pyright', 'quick_lint_js', 'sqlls', 'vimls'
-- }
local servers = { 'bashls', 'html', 'pyright', 'sqlls', 'vimls' }
for _, server in pairs(servers) do
  lsp[server].setup {}
end

lsp.clangd.setup { on_attach = on_attach }
lsp.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = {'vim'}
      }
    }
  },
}

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = false,
  severity_sort = true,
  -- float = {
  --   border = "rounded",
  --   format = function(diagnostic)
  --     return string.format(
  --       "%s (%s) [%s]",
  --       diagnostic.message,
  --       diagnostic.source,
  --       diagnostic.code or diagnostic.user_data.lsp.code
  --     )
  --   end,
  -- },
})
