return {
	{
		"michaelb/sniprun",
		lazy = true,
		cmd = "SnipRun",
		build = "sh ./install.sh",
		config = function()
			require("sniprun").setup({})
		end,
	},
	{
		"max397574/better-escape.nvim",
		lazy = true,
		event = "VeryLazy",
		commit = "7e86edafb8c7e73699e0320f225464a298b96d12",
		opts = {
			mapping = { "jk", "kj" },
			clear_empty_lines = false,
			keys = "<Esc>",
		},
		config = function(_, opts)
			require("better_escape").setup(opts)
		end,
	},
	{
		"windwp/nvim-autopairs",
		enabled = true,
		lazy = true,
		event = "InsertEnter",
		opts = {
			check_ts = true,
		},
	},
	{
		"kylechui/nvim-surround",
		enabled = false,
		lazy = true,
		keys = { "ys", "yS" },
		opts = {},
	},
	{
		"alvan/vim-closetag",
		lazy = true,
		ft = { "html", "djangohtml", "htmldjango" },
	},
	{
		"numToStr/Comment.nvim",
		enabled = false,
		lazy = true,
		keys = { "gc", "V" },
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"Vimjas/vim-python-pep8-indent",
		lazy = true,
		ft = { "python", "py" },
	},
	{
		"folke/flash.nvim",
		lazy = true,
		keys = {
			{
				"<leader>s",
				mode = { "n", "o", "x" },
				function()
					require("flash").jump()
				end,
				desc = "Flash Jump",
			},
			{
				"<leader>S",
				mode = { "n", "o", "x" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"<leader>e",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Flash Remote",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Flash Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Flash Toggle",
			},
		},
		config = function()
			vim.api.nvim_set_hl(0, "FlashMatch", { fg = "#89b4fa" })
			vim.api.nvim_set_hl(0, "FlashCurrent", { fg = "#a6e3a1" })
			vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#11111b", bg = "#f38ba8" })
		end,
	},
	{
		"lambdalisue/suda.vim",
		enabled = false,
		lazy = true,
		cmd = "SudaWrite",
		keys = {
			"<leader>sw",
			mode = "n",
			"<cmd>SudaWrite<cr>",
			desc = "Sudo Write",
		},
	},
	{ -- parse and color ansi escape color codes
		"m00qek/baleia.nvim",
		enabled = false,
		lazy = true,
		cmd = { "BaleiaColorize" },
		config = function()
			require("baleia").setup({})
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		lazy = true,
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"folke/which-key.nvim",
		enabled = true,
		event = "VeryLazy",
		config = function()
			require("which-key").add({
				{ "<leader>t", group = "Telescope" },
				{ "<leader>d", group = "Debugger" },
				{ "<leader>g", group = "Gitsigns" },
				{ "<leader>gt", group = "Toggle" },
				{ "<leader>x", group = "Trouble" },
				{ "<leader>c", group = "Trouble" },
			})
		end,
	},
	{ "tpope/vim-abolish" },
	{
		"kevinhwang91/nvim-bqf",
		lazy = true,
		ft = { "qf" },
	},
	{
		"jidn/vim-dbml",
		lazy = true,
		ft = { "dbml" },
	},
	{
		"chrisbra/unicode.vim",
		lazy = true,
	},
	{
		"tree-sitter-grammars/tree-sitter-hyprlang",
		lazy = true,
		event = "VeryLazy",
		init = function()
			vim.filetype.add({
				pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
			})
		end,
	},
}
