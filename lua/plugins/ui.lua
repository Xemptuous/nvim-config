return {
	{
		"nvim-lualine/lualine.nvim",
		enabled = false,
		lazy = true,
		-- event = "BufReadPre",
		event = "VeryLazy",
		opts = {
			options = {
				theme = "catppuccin",
			},
			sections = {
				lualine_c = {
					{
						"filename",
						file_status = true,
						path = 3,
					},
				},
				lualine_x = { "filetype" },
			},
			inactive_sections = {
				lualine_c = {
					{
						"filename",
						file_status = true,
						path = 4,
					},
				},
			},
		},
	},
	{
		"mikesmithgh/borderline.nvim",
		enabled = false,
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("borderline").setup({})
			require("borderline.api").borderline("single")
		end,
	},
	{
		"folke/twilight.nvim",
		enabled = false,
		lazy = true,
		keys = "<leader>d",
		opts = {
			dimming = {
				alpha = 0.25, -- amount of dimming
				-- we try to get the foreground from the highlight groups or fallback color
				color = { "Normal", "#ffffff" },
				term_bg = "#000000", -- if guibg=NONE, this will be used to calculate text color
				inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
			},
			context = 10, -- amount of lines we will try to show around the current line
			treesitter = true, -- use treesitter when available for the filetype
			-- treesitter is used to automatically expand the visible text,
			-- but you can further control the types of nodes that should always be fully expanded
			expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
				"function",
				"method",
				"table",
				"if_statement",
			},
			exclude = {}, -- exclude these filetypes
		},
		config = function(_, opts)
			require("twilight").setup(opts)
			vim.api.nvim_set_keymap("n", "<leader>d", [[:Twilight<CR>]], {})
		end,
	},
	{
		"NeogitOrg/neogit",
		enabled = true,
		lazy = true,
		keys = { "<leader>ng" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		-- config = true,
		config = function()
			require("neogit").setup({
				mappings = {
					popup = {
						["l"] = false,
						["L"] = "LogPopup",
					},
				},
			})
			vim.api.nvim_set_keymap("n", "<leader>ng", [[:Neogit<CR>]], { noremap = true, desc = "NeoGit" })
		end,
	},
	{
		"tpope/vim-fugitive",
		enabled = false,
		lazy = true,
		event = "VeryLazy",
	},
	{
		"lewis6991/gitsigns.nvim",
		enabled = true,
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("gitsigns").setup({
				signcolumn = false, -- Toggle with `:Gitsigns toggle_signs`
				numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
				linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
				word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
				on_attach = function(bufnr)
					local gitsigns = require("gitsigns")

					local function map(mode, l, r, opts)
						opts = opts or {}
						opts.buffer = bufnr
						vim.keymap.set(mode, l, r, opts)
					end

					-- Navigation
					map("n", "]g", function()
						if vim.wo.diff then
							vim.cmd.normal({ "]c", bang = true })
						else
							gitsigns.nav_hunk("next")
						end
					end, { desc = "Next" })

					map("n", "[g", function()
						if vim.wo.diff then
							vim.cmd.normal({ "[c", bang = true })
						else
							gitsigns.nav_hunk("prev")
						end
					end, { desc = "Previous" })

					-- Actions
					map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "Stage Hunk" })
					map("v", "<leader>gs", function()
						gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end, { desc = "Stage Hunk" })
					map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Reset Hunk" })
					map("v", "<leader>gr", function()
						gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end, { desc = "Reset Hunk" })
					map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "Stage Buffer" })
					map("n", "<leader>gu", gitsigns.undo_stage_hunk, { desc = "Undo Stage Hunk" })
					map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "Reset Buffer" })
					map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Preview Hunk" })
					map("n", "<leader>gb", function()
						gitsigns.blame_line({ full = true })
					end, { desc = "Blame Line" })
					map("n", "<leader>gB", gitsigns.toggle_current_line_blame, { desc = "Toggle Current Line Blame" })
					map("n", "<leader>gd", gitsigns.diffthis, { desc = "Diff This" })
					map("n", "<leader>gq", gitsigns.setqflist, { desc = "Set Quickfix List" })
					map("n", "<leader>gl", gitsigns.setloclist, { desc = "Set Location List" })
					map("n", "<leader>gD", function()
						gitsigns.diffthis("~")
					end, { desc = "Diff This HEAD~" })
					map("n", "<leader>gtd", gitsigns.toggle_deleted, { desc = "Toggle Deleted" })
					map("n", "<leader>gts", "<cmd>:Gitsigns toggle_signs<cr>", { desc = "Toggle Signs" })
					map("n", "<leader>gtn", "<cmd>:Gitsigns toggle_numhl<cr>", { desc = "Toggle Number Highlight" })
					map("n", "<leader>gtl", "<cmd>:Gitsigns toggle_linehl<cr>", { desc = "Toggle Line Highlight" })
					map("n", "<leader>gtw", "<cmd>:Gitsigns toggle_word_diff<cr>", { desc = "Toggle Word Diff" })
					-- Text object
					map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select Hunk" })
				end,
			})
		end,
	},
	{
		"kristijanhusak/vim-dadbod-ui",
		lazy = true,
		cmd = "DBUI",
		dependencies = {
			"tpope/vim-dadbod",
			{
				"kristijanhusak/vim-dadbod-completion",
				lazy = true,
				ft = { "sql", "mysql", "plsql" },
			},
		},
	},
	{
		"xemptuous/sqlua.nvim",
		lazy = true,
		cmd = "SQLua",
		config = function()
			require("sqlua").setup({
				load_connections_on_start = false,
			})
		end,
	},
	{
		"kndndrj/nvim-dbee",
		enabled = false,
		lazy = true,
		cmd = "Dbee",
		dependencies = { "MunifTanjim/nui.nvim" },
		build = function()
			require("dbee").install()
		end,
		config = function()
			require("dbee").setup({
				sources = {
					require("dbee.sources").FileSource:new(vim.fn.stdpath("data") .. "/dbee/connections.json"),
				},
				default_connection = "americor-crm",
				editor = {
					mappings = {
						{ key = "<leader>r", mode = "v", action = "run_selection" },
						{ key = "<leader>r", mode = "n", action = "run_file" },
					},
				},
			})
		end,
	},
	{ -- Minimap Sidebar
		enabled = false,
		"gorbit99/codewindow.nvim",
		lazy = true,
		keys = "<leader>mm",
		opts = {
			auto_enable = false,
			minimap_width = 15,
			window_border = "single",
			-- width_multiplier = 4,
			-- show_cursor = false,
		},
		config = function(_, opts)
			require("codewindow").setup(opts)
			require("codewindow").apply_default_keybinds()
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		enabled = false,
		lazy = true,
		cmd = { "VimEnter", "NvimTreeToggle" },
		keys = "<C-t>",
		dependencies = {
			-- "nvim-tree/nvim-web-devicons",
			"echasnovski/mini.icons",
		},
		init = function()
			-- open nvimtree on dir open
			local function open_nvim_tree(data)
				local directory = vim.fn.isdirectory(data.file) == 1

				if not directory then
					return
				end

				vim.cmd.enew()
				vim.cmd.bw(data.buf)
				vim.cmd.cd(data.file)
				require("nvim-tree.api").tree.open()
			end

			vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
		end,
		opts = function()
			local function on_attach(bufnr)
				local api = require("nvim-tree.api")

				local function opts(desc)
					return {
						desc = "nvim-tree: " .. desc,
						buffer = bufnr,
						noremap = true,
						silent = true,
						nowait = true,
					}
				end
				api.config.mappings.default_on_attach(bufnr)

				vim.keymap.set("n", "<C-[>", api.tree.change_root_to_parent, opts("Up"))
				vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
				vim.keymap.set("n", "<C-T>", api.tree.close, opts("Close"))
			end
			return {
				sort_by = "case_sensitive",
				renderer = {
					group_empty = true,
				},
				filters = {
					dotfiles = true,
				},
				on_attach = on_attach,
			}
		end,
		config = function(_, opts)
			require("nvim-tree").setup()
			local k = vim.api.nvim_set_keymap
			k("n", "<C-t>", [[:NvimTreeToggle<CR>]], {})
			-- k("n", "<C-n>", [[:NvimTreeFocus<CR>]], {})
			-- k("n", "<F9>", [[:TagbarToggle<CR>]], {})
		end,
	},
	{
		"stevearc/dressing.nvim",
		enabled = false,
		lazy = true,
		opts = {},
	},
	{
		"2kabhishek/nerdy.nvim",
		lazy = true,
		cmd = "Nerdy",
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
	{
		"glench/vim-jinja2-syntax",
		lazy = true,
		event = "VeryLazy",
	},
	{
		"folke/trouble.nvim",
		ops = {},
		config = function()
			require("trouble").setup()
		end,
		lazy = true,
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
}
