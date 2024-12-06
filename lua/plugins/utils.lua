return {
	{
		"michaelb/sniprun",
		cmd = "SnipRun",
		build = "sh ./install.sh",
		config = function()
			require("sniprun").setup({})
		end,
	},
	{
		"max397574/better-escape.nvim",
		event = { "InsertEnter" },
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
		event = "InsertEnter",
		opts = {
			check_ts = true,
		},
	},
	{
		"kylechui/nvim-surround",
		enabled = false,
		keys = { "ys", "yS" },
		opts = {},
	},
	{
		"alvan/vim-closetag",
		ft = { "html", "djangohtml", "htmldjango" },
	},
	{
		"numToStr/Comment.nvim",
		enabled = false,
		keys = { "gc", "V" },
		config = function()
			require("Comment").setup()
		end,
	},
	{ "Vimjas/vim-python-pep8-indent", enabled = false, ft = { "python", "py" } },
	{
		"folke/flash.nvim",
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
		cmd = { "BaleiaColorize" },
		config = function()
			require("baleia").setup({})
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			require("which-key").add({
				{ "<leader>t", group = "Telescope" },
				{ "<leader>d", group = "Debugger" },
				{ "<leader>g", group = "Git" },
				{ "<leader>n", group = "NeoGit" },
				{ "<leader>gt", group = "Toggle" },
				{ "<leader>x", group = "Trouble" },
				{ "<leader>c", group = "Trouble" },
			})
		end,
	},
	{ "tpope/vim-abolish", keys = "cr" },
	{ "kevinhwang91/nvim-bqf", ft = { "qf" } },
	{ "jidn/vim-dbml", enabled = false, ft = { "dbml" } },
	{ "chrisbra/unicode.vim", event = "VeryLazy" },
	{
		"MagicDuck/grug-far.nvim",
		cmd = "GrugFar",
		config = function()
			require("grug-far").setup({})
		end,
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		keys = {
			{
				"<leader>.",
				function()
					Snacks.scratch()
				end,
				desc = "Toggle Scratch Buffer",
			},
			{
				"<leader>gB",
				function()
					Snacks.gitbrowse()
				end,
				desc = "Git Browse",
			},
		},
		opts = {
			bigfile = { enabled = true },
			dashboard = { enabled = true },
			gitbrowse = { enabled = true },
			quickfile = { enabled = false },
			statuscolumn = { enabled = false },
		},
		init = function()
			vim.api.nvim_create_autocmd("User", {
				pattern = "VeryLazy",
				callback = function()
					-- -- Setup some globals for debugging (lazy-loaded)
					-- _G.dd = function(...)
					-- 	Snacks.debug.inspect(...)
					-- end
					-- _G.bt = function()
					-- 	Snacks.debug.backtrace()
					-- end
					vim.print = _G.dd -- Override print to use snacks for `:=` command
					Snacks.toggle.treesitter():map("\\T")
					Snacks.toggle.inlay_hints():map("\\H")
					Snacks.toggle.line_number():map("\\l")
					Snacks.toggle.option("wrap", { name = "Wrap" }):map("\\w")
					Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("\\r")
					Snacks.toggle.option("ignorecase", { name = "Ignore Case" }):map("\\i")
					Snacks.toggle.option("hlsearch", { name = "Highlight Search" }):map("\\h")
				end,
			})
		end,
	},
}
