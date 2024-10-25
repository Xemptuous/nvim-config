return {
	{
		"catppuccin/nvim",
		enabled = true,
		priority = 1000,
		opts = {
			flavour = "mocha",
			dim_inactive = {
				enabled = true,
				shade = "dark",
				percentage = 0.01,
			},
			integrations = {
				cmp = true,
				dadbod_ui = true,
				flash = true,
				gitsigns = true,
				indent_blankline = { enabled = true },
				lsp_saga = true,
				mason = true,
				mini = { enabled = true },
				notify = true,
				nvim_surround = true,
				nvimtree = true,
				render_markdown = true,
				markdown = true,
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
				rainbow_delimiters = true,
				semantic_tokens = true,
				telescope = { enabled = true },
				treesitter = true,
			},
			custom_highlights = function(C)
				return {
					-- CmpItemAbbrMatch = { fg = C.red, bg = C.surface0 },
					-- CmpItemAbbrMatchFuzzy = { fg = C.red, bg = C.surface0 },
					PmenuSel = { fg = C.text, bg = C.surface1 },
					Pmenu = { fg = C.text, bg = C.mantle },
					NormalFloat = { fg = C.text, bg = C.base },
					CmpItemMenu = { fg = C.text, bg = C.mantle },

					FloatBorder = { fg = C.surface1, bg = C.base },
					-- CmpItemKindSnippet = { fg = C.base, bg = C.mauve },
					-- CmpItemKindKeyword = { fg = C.base, bg = C.red },
					-- CmpItemKindText = { fg = C.base, bg = C.teal },
					-- CmpItemKindMethod = { fg = C.base, bg = C.blue },
					-- CmpItemKindConstructor = { fg = C.base, bg = C.blue },
					-- CmpItemKindFunction = { fg = C.base, bg = C.blue },
					-- CmpItemKindFolder = { fg = C.base, bg = C.blue },
					-- CmpItemKindModule = { fg = C.base, bg = C.blue },
					-- CmpItemKindConstant = { fg = C.base, bg = C.peach },
					-- CmpItemKindField = { fg = C.base, bg = C.green },
					-- CmpItemKindProperty = { fg = C.base, bg = C.green },
					-- CmpItemKindEnum = { fg = C.base, bg = C.green },
					-- CmpItemKindUnit = { fg = C.base, bg = C.green },
					-- CmpItemKindClass = { fg = C.base, bg = C.yellow },
					-- CmpItemKindVariable = { fg = C.base, bg = C.flamingo },
					-- CmpItemKindFile = { fg = C.base, bg = C.blue },
					-- CmpItemKindInterface = { fg = C.base, bg = C.yellow },
					-- CmpItemKindColor = { fg = C.base, bg = C.red },
					-- CmpItemKindReference = { fg = C.base, bg = C.red },
					-- CmpItemKindEnumMember = { fg = C.base, bg = C.red },
					-- CmpItemKindStruct = { fg = C.base, bg = C.blue },
					-- CmpItemKindValue = { fg = C.base, bg = C.peach },
					-- CmpItemKindEvent = { fg = C.base, bg = C.blue },
					-- CmpItemKindOperator = { fg = C.base, bg = C.blue },
					-- CmpItemKindTypeParameter = { fg = C.base, bg = C.blue },
					-- CmpItemKindCopilot = { fg = C.base, bg = C.teal },
				}
			end,
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"nyoom-engineering/oxocarbon.nvim",
		priority = 1000,
		-- config = function()
		-- 	vim.opt.background = "dark"
		-- 	vim.cmd.colorscheme("oxocarbon")
		-- 	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		-- 	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		-- 	-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
		-- end,
	},
	-- { "zenbones-theme/zenbones.nvim", dependencies = { "rktjmp/lush.nvim" }, lazy = true, event = "VeryLazy" },
	-- { "folke/tokyonight.nvim", lazy = true, event = "VeryLazy" },
	-- { "NLKNguyen/papercolor-theme", lazy = true, event = "VeryLazy" },
	-- { "MetriC-DT/balance-theme.nvim", lazy = true, event = "VeryLazy" },
	-- { "sainnhe/edge", lazy = true, event = "VeryLazy" },
	-- { "neanias/everforest-nvim", lazy = true, event = "VeryLazy" },
	-- { "projekt0n/github-nvim-theme", lazy = true, event = "VeryLazy" },
	-- { "Shatur/neovim-ayu", lazy = true, event = "VeryLazy" },
	-- { "maxmx03/solarized.nvim", lazy = true, event = "VeryLazy" },
	-- { "nyoom-engineering/nyoom.nvim", lazy = true, event = "VeryLazy" },
	-- { "scottmckendry/cyberdream.nvim", lazy = true, event = "VeryLazy" },
	-- { "ryanpcmcquen/true-monochrome_vim", lazy = true, event = "VeryLazy" },
	-- { "owickstrom/vim-colors-paramount", lazy = true, event = "VeryLazy" },
	-- { "axvr/photon.vim", lazy = true, event = "VeryLazy" },
	-- { "widatama/vim-phoenix", lazy = true, event = "VeryLazy" },
	-- { "rebelot/kanagawa.nvim", lazy = true, event = "VeryLazy" },
	-- { "marko-cerovac/material.nvim", lazy = true, event = "VeryLazy" },
	-- { "shaunsingh/nord.nvim", lazy = true, event = "VeryLazy" },
	-- { "alexvzyl/nordic.nvim", lazy = true, event = "VeryLazy" },
}
