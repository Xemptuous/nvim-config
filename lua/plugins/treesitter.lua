require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"c",
		"cpp",
		"html",
		"htmldjango",
		"javascript",
		"json",
		"json5",
		"lua",
		"markdown",
		"markdown_inline",
		"python",
		"vim",
	},
	highlight = {
		enable = true,
		use_languagetree = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
		disable = { "python" },
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
