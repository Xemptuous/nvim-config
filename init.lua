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

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
	install = { colorscheme = { "catppuccin" } },
	-- defaults = { lazy = true },
	ui = { border = "rounded" },
	change_detection = {
		enabled = true,
		notify = false,
	},
	performance = {
		cache = { enabled = true },
		rtp = {
			disabled_plugins = {
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
				"node",
				"perl",
				"python3",
				"ruby",
			},
		},
	},
})

-- Resize windows on resize
vim.api.nvim_create_autocmd({ "VimResized" }, {
	pattern = { "*" },
	command = "wincmd =",
})

package.path = "./lua/?.lua; ./lua/?.vim" .. package.path
require("keymaps")
require("options")
-- require("init")
