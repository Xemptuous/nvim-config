local ms = require('mason')
ms.setup({
  ui = {
    border = "single"
  }
})

local lsps = {
  bashls = 'bash-language-server',
  clangd = 'clangd',
  cssls = 'css-lsp',
  html = 'html-lsp',
  jdtls = 'jdtls',
  sumneko_lua = 'lua-language-server',
  pyright = 'pyright',
  quick_lint_js = 'quick-lint-js',
  vimls = 'vim-language-server'
}

local function scandir(directory)
    local i, t, popen = 0, {}, io.popen
    local pfile = popen('ls "'..directory..'"')
    for filename in pfile:lines() do
        i = i + 1
        t[i] = filename
    end
    pfile:close()
    return t
end

local lsp_folder = vim.fn.stdpath("data").."/lsp_servers/"
os.execute("mkdir -p "..lsp_folder)
local dirs = scandir(lsp_folder)

local function isInstalled(lsp)
  for _, dir in pairs(dirs) do
    if dir == lsp then
      return true
    end
  end
  return false
end

for key, lsp in pairs(lsps) do
  if not isInstalled(key) then
    vim.cmd(':MasonInstall '..lsp)
  end
end
-- vim.cmd [[
--   :MasonInstall bash-language-server clangd css-lsp html-lsp jdtls lua-language-server pyright quick-lint-js sqlls vim-language-server
-- ]]
