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
	rainbow = {
		enable = true,
		query = {
			"rainbow-parens",
			html = "rainbow-tags",
		},
		strategy = require("ts-rainbow.strategy.global"),
		hlgroups = {
			"TSRainbowYellow",
			"TSRainbowBlue",
			"TSRainbowRed",
			"TSRainbowGreen",
			"TSRainbowOrange",
			"TSRainbowViolet",
			"TSRainbowCyan",
		},
	},
})
vim.api.nvim_set_hl(0, "MatchParen", { fg = "#cdd6f4", bg = "#45475a" })
-- vim.api.nvim_set_hl(0, "TSRainbowRed", {fg = "#f38ba8"})
-- vim.api.nvim_set_hl(0, "TSRainbowOrange", {fg = "#fab387"})
-- vim.api.nvim_set_hl(0, "TSRainbowYellow", {fg = "#f9e2af"})
-- vim.api.nvim_set_hl(0, "TSRainbowCyan", {fg = "#94e2d5"})
-- vim.api.nvim_set_hl(0, "TSRainbowGreen", {fg = "#a7e3a1"})
-- vim.api.nvim_set_hl(0, "TSRainbowBlue", {fg = "#89b4fa"})
-- vim.api.nvim_set_hl(0, "TSRainbowViolet", {fg = "#cba6f7"})
