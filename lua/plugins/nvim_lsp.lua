-- require("mason").setup()
-- require("mason-lspconfig").setup()
-- local on_attach = function(client, bufnr)
--   client.server_capabilities.semanticTokensProvider = nil
-- end
local jdtls_bin = vim.fn.stdpath("data") .. "/mason/bin/jdtls"
local lsp_attach = function(client, bufnr)
  -- mappings here
end

local rt = require("rust-tools")
rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      -- vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      -- vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

local lsp = require('lspconfig')
local types = {
  bash = lsp.bashls.setup {},
  c = lsp.clangd.setup {},
  cpp = lsp.clangd.setup {},
  -- c = lsp.clangd.setup {},
  -- cpp = lsp.clangd.setup {},
  java = lsp.jdtls.setup {
    cmd = { jdtls_bin },
    on_attach = lsp_attach,
  },
  -- java = lsp.javals.setup {
  -- },
  html = lsp.html.setup {},
  htmldjango = lsp.html.setup {},
  python = lsp.pyright.setup {},
  -- rust = lsp.rust_analyzer.setup {},
  sql = lsp.sqlls.setup {},
  vim = lsp.vimls.setup {},
  lua = lsp.lua_ls.setup {
    settings = {
      Lua = {
        diagnostics = {
          globals = {'vim'}
        }
      }
    },
  }
}

-- load only needed LSP's
local type = vim.bo.filetype
local _ = types[type]

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  severity_sort = true,
  update_in_insert = false
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    update_in_insert = false
  }
)

