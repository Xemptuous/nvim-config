local ms = require("mason")
local mr = require("mason-registry")
ms.setup({
	ui = {
		border = "single",
	},
})

local requirements = {
	-- LSPs
	"bash-language-server",
	"clangd",
	"css-lsp",
	"debugpy",
	"html-lsp",
	"jdtls",
	"lua-language-server",
	"pyright",
	"quick-lint-js",
	"rust-analyzer",
	"sqlls",
	"vim-language-server",
	-- Linters
	"jsonlint",
	"luacheck",
	"quick-lint-js",
	"ruff",
	"sqlfluff",
	-- Formatters
	"black",
	"jq",
	"rustfmt",
	"shfmt",
	"sql-formatter",
	"stylua",
    "clang-format"
}

for _, r in pairs(requirements) do
	if not mr.is_installed(r) then
		vim.cmd(":MasonInstall " .. r)
	end
end
