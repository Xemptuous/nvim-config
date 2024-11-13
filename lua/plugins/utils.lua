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
				"<space>e",
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
		enabled = true,
		event = "VeryLazy",
		config = function()
			local wk = require("which-key")
			wk.setup()
			wk.register({
				["<space>"] = {
					s = { "<cmd>:lua require('flash').jump()<cr>", "Flash Jump" },
					S = { "<cmd>:lua require('flash').treesitter()<cr>", "Flash Treesitter" },
					e = { "<cmd>:lua require('flash').remote()<cr>", "Flash Remote" },
					b = { "<cmd>Pick buffers<cr>", "Grep Buffers" },
					f = { "<cmd>Pick files<cr>", "Grep Files" },
					g = { "<cmd>Pick grep<cr>", "Grep" },
					G = { "<cmd>Pick grep_live<cr>", "Grep Live" },
					h = { "<cmd>Pick help<cr>", "Grep Help" },
				},
				["<leader>"] = {
					t = {
						name = "Telescope",
						o = { "<cmd>Telescope vim_options<cr>", "Vim Options" },
						f = { "<cmd>Telescope find_files<cr>", "Find File" },
						g = { "<cmd>Telescope live_grep<cr>", "Grep" },
						b = { "<cmd>Telescope buffers<cr>", "Buffers" },
						h = { "<cmd>Telescope help_tags<cr>", "Help" },
						m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
						k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
						R = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
						w = { "<cmd>Telescope grep_string{}<CR>", "String" },
						H = { "<cmd>Telescope search_history{}<CR>", "Search History" },
						C = { "<cmd>Telescope command_history{}<CR>", "Command History" },
						c = { "<cmd>Telescope commands{}<CR>", "Colorscheme" },
						r = { "<cmd>Telescope registers{}<CR>", "Registers" },
						-- b = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle Current Line Blame" },
						d = { "<cmd>Gitsigns toggle_deleted<cr>", "Gitsigns Toggle Deleted" },
					},
					d = {
						name = "Debugger",
						["<F5>"] = { "<cmd>DapContinue<CR>", "Continue" },
						["<F6>"] = { "<cmd>DapStepOver<CR>", "StepOver" },
						["<F7>"] = { "<cmd>DapStepInto<CR>", "StepInto" },
						["<F8>"] = { "<cmd>DapStepOut<CR>", "StepOut" },
						b = { "<cmd>DapToggleBreakpoint<CR>", "Breakpoint Toggle" },
						r = { "<cmd>DapToggleReplCR>", "REPL Toggle" },
						l = { "<cmd>:lua require('dap').run_last()<cr>", "Run Last" },
						h = { "<cmd>:lua require('dap.ui.widgets').hover()<cr>", "Show Hover Info" },
						p = { "<cmd>:lua require('dap.ui.widgets').preview()<cr>", "Show Preview" },
						f = { "<cmd>:lua widgets.centered_float(require('dap.ui.widgets').frames)", "Show Frames" },
						s = { "<cmd>:lua widgets.centered_float(require('dap.ui.widgets').scopes)", "Show Scopes" },
					},
					h = {
						name = "Gitsigns Hunks",
						s = { "<cmd>Gitsigns stage_hunk<cr>", "Stage Hunk" },
						r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk" },
						S = { "<cmd>Gitsigns stage_buffer<cr>", "Stage Buffer" },
						u = { "<cmd>Gitsigns undo_stage_hunk<cr>", "Undo Stage Hunk" },
						R = { "<cmd>Gitsigns reset_buffer<cr>", "Reset Buffer" },
						p = { "<cmd>Gitsigns preview_hunk<cr>", "Preview Hunk" },
						b = { "<cmd>:lua require('gitsigns').blame_line({full = true})<cr>", "Show Blame Full" },
						d = { "<cmd>Gitsigns diffthis<cr>", "Diff This" },
						g = { "<cmd>Gitsigns setqflist<cr>", "Set Quickfix List" },
						D = { "<cmd>:lua require('gitsigns').diffthis('~')<cr>", "Diff This Dir" },
					},
					m = {
						name = "Telescope Marks",
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
