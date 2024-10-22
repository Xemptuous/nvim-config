-- disable some builtin vim plugins
vim.loader.enable()
for _, plugin in pairs({
	"tutor",
	"2html_plugin",
	"getscript",
	"getscriptPlugin",
	"gzip",
	"logipat",
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"matchit",
	"tar",
	"tarPlugin",
	"rrhelper",
	"spellfile_plugin",
	"vimball",
	"vimballPlugin",
	"zip",
	"zipPlugin",
	"rplugin",
	"tohtml",
	"zipPlugin",
	"syntax",
	"synmenu",
	"optwin",
	"compiler",
	"bugreport",
	"ftplugin",
}) do
	vim.g["loaded_" .. plugin] = 1
end

for _, provider in ipairs({ "node", "perl", "python3", "ruby" }) do
	vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- Resize windows on resize
vim.api.nvim_create_autocmd({ "VimResized" }, {
	pattern = { "*" },
	command = "wincmd =",
})

package.path = "./lua/?.lua; ./lua/?.vim" .. package.path
require("keymaps")
require("options")
require("init")
