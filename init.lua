-- disable some builtin vim plugins
local g = vim.g
local default_plugins = {
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
}
for _, plugin in pairs(default_plugins) do
	g["loaded_" .. plugin] = 1
end

local default_providers = {
	"node",
	"perl",
	"python3",
	"ruby",
}
for _, provider in ipairs(default_providers) do
	g["loaded_" .. provider .. "_provider"] = 0
end

-- open nvimtree on dir open
local function open_nvim_tree(data)
	local directory = vim.fn.isdirectory(data.file) == 1

	if not directory then
		return
	end

	vim.cmd.enew()
	vim.cmd.bw(data.buf)
	vim.cmd.cd(data.file)
	require("nvim-tree.api").tree.open()
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*" },
	command = "FormatWrite",
})

package.path = "./lua/?.lua;" .. package.path
require("keymaps.init")
require("options")
require("init")
