return {
	{
		"catppuccin/nvim",
		enabled = true,
		lazy = false,
		priority = 1000,
		opts = {
			flavour = "mocha",
			background = { -- :h background
				light = "mocha",
				dark = "mocha",
			},
			transparent_background = false,
			dim_inactive = {
				enabled = true,
				shade = "dark",
				percentage = 0.01,
			},
			styles = {
				comments = { "italic" },
				conditionals = { "italic" },
			},
			-- color_overrides = {
			--     all = {
			--         base = "#0d0d14",
			--         mantle = "#08080d",
			--     }
			-- },
			-- custom_highlights = {
			--     -- vim.cmd('hi def IlluminatedWordText gui=underline')
			--     vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#1e1e2e", underline = true }),
			--     vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#1e1e2e", underline = true }),
			--     vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#1e1e2e", underline = true }),
			--     -- vim.api.nvim_set_hl(0, 'FloatBorder', {fg = '#4fa6ed'})
			--     -- vim.api.nvim_set_hl(0, 'Pmenu', {fg = '#4fa6ed'})
			--     -- vim.api.nvim_set_hl(0, 'FloatBorder', {fg = '#4fa6ed', bg = "#313244"})
			-- },
			integrations = {
				cmp = true,
				flash = true,
				gitsigns = true,
				nvimtree = true,
				indent_blankline = { enabled = true },
				mason = true,
				lsp_saga = true,
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
					},
					underlines = {
						errors = { "undercurl" },
						hints = { "undercurl" },
						warnings = { "undercurl" },
						information = { "undercurl" },
					},
					inlay_hints = {
						background = true,
					},
				},
				semantic_tokens = true,
				rainbow_delimiters = true,
				telescope = true,
				treesitter = true,
			},
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"zenbones-theme/zenbones.nvim",
		dependencies = { "rktjmp/lush.nvim" },
		lazy = true,
		event = "VeryLazy",
	},
	{
		"folke/tokyonight.nvim",
		lazy = true,
		event = "VeryLazy",
	},
	{
		"NLKNguyen/papercolor-theme",
		lazy = true,
		event = "VeryLazy",
	},
	{
		"MetriC-DT/balance-theme.nvim",
		lazy = true,
		event = "VeryLazy",
	},
	{
		"sainnhe/edge",
		lazy = true,
		event = "VeryLazy",
	},
	{
		"neanias/everforest-nvim",
		lazy = true,
		event = "VeryLazy",
	},
	{
		"projekt0n/github-nvim-theme",
		lazy = true,
		event = "VeryLazy",
	},
	{
		"Shatur/neovim-ayu",
		lazy = true,
		event = "VeryLazy",
	},
	{
		"maxmx03/solarized.nvim",
		lazy = true,
		event = "VeryLazy",
	},
	{
		"nyoom-engineering/nyoom.nvim",
		lazy = true,
		event = "VeryLazy",
	},
	{
		"scottmckendry/cyberdream.nvim",
		lazy = true,
		event = "VeryLazy",
	},
	{
		"preservim/vim-colors-pencil",
		lazy = true,
		event = "VeryLazy",
	},
	{
		"yorik1984/newpaper.nvim",
		lazy = true,
		event = "VeryLazy",
	},
	{
		"ryanpcmcquen/true-monochrome_vim",
		lazy = true,
		event = "VeryLazy",
	},
	{
		"owickstrom/vim-colors-paramount",
		lazy = true,
		event = "VeryLazy",
	},
}
