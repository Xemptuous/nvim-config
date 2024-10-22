local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	print("Lazy not found. Cloning repo...")
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
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
	install = {
		colorscheme = {
			"catppuccin",
		},
	},
})
