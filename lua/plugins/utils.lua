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
		enabled = true,
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
				"<space>s",
				mode = { "n", "o", "x" },
				function()
					require("flash").jump()
				end,
			},
			{
				"<space>S",
				mode = { "n", "o", "x" },
				function()
					require("flash").treesitter()
				end,
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
			},
		},
		config = function()
			vim.api.nvim_set_hl(0, "FlashMatch", { fg = "#89b4fa" })
			vim.api.nvim_set_hl(0, "FlashCurrent", { fg = "#a6e3a1" })
			vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#11111b", bg = "#f38ba8" })
		end,
	},
	{
		"ggandor/leap.nvim",
		enabled = false,
		lazy = true,
		keys = { { "s", mode = { "n", "o", "x" } } },
		config = function()
			require("leap").create_default_mappings()
		end,
	},
	{
		"lambdalisue/suda.vim",
		lazy = true,
		cmd = "SudaWrite",
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
		enabled = false,
		event = "VeryLazy",
		config = function()
			local wk = require("which-key")
			wk.setup()
			wk.register({
				["<leader>"] = {
					t = {
						name = "Telescope",
						f = { "<cmd>Telescope find_files<cr>", "Find File" },
						g = { "<cmd>Telescope live_grep<cr>", "Grep" },
						b = { "<cmd>Telescope buffers<cr>", "Buffers" },
						h = { "<cmd>Telescope help_tags<cr>", "Help" },
						R = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
						w = { "<cmd>Telescope grep_string{}<CR>", "String" },
						H = { "<cmd>Telescope search_history{}<CR>", "Search History" },
						C = { "<cmd>Telescope command_history{}<CR>", "Command History" },
						c = { "<cmd>Telescope colorscheme{}<CR>", "Colorscheme" },
						r = { "<cmd>Telescope registers{}<CR>", "Registers" },
					},
					d = {
						name = "Debugger",
						["<F5>"] = { "<cmd>DapContinue<CR>", "Continue" },
						["<F6>"] = { "<cmd>DapStepOver<CR>", "StepOver" },
						["<F7>"] = { "<cmd>DapStepInto<CR>", "StepInto" },
						["<F8>"] = { "<cmd>DapStepOut<CR>", "StepOut" },
						b = { "<cmd>DapToggleBreakpoint<CR>", "Breakpoint Toggle" },
						r = { "<cmd>DapToggleReplCR>", "REPL Toggle" },
						l = { "<cmd>:lua require('dap').run_last()", "Run Last" },
						h = { "<cmd>:lua require('dap.ui.widgets').hover()", "Show Hover Info" },
						p = { "<cmd>:lua require('dap.ui.widgets').preview()", "Show Preview" },
						f = { "<cmd>:lua widgets.centered_float(require('dap.ui.widgets').frames)", "Show Frames" },
						s = { "<cmd>:lua widgets.centered_float(require('dap.ui.widgets').scopes)", "Show Scopes" },
					},
					m = {
						name = "Code Window",
						o = {},
					},
				},
			}, {
				mode = "n",
				prefix = "",
				buffer = nil,
				silent = true,
				noremap = true,
				nowait = false,
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
}
