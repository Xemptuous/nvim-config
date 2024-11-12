return {
	{
		"echasnovski/mini.ai",
		lazy = true,
		event = "VeryLazy",
		opts = {},
	},
	{
		"echasnovski/mini.bufremove",
		lazy = true,
		event = "VeryLazy",
		opts = {},
	},
	{
		"echasnovski/mini.comment",
		lazy = true,
		keys = { "gc", "V" },
		opts = {},
	},
	{
		"echasnovski/mini.completion",
		enabled = false,
		lazy = true,
		event = "VeryLazy",
		opts = {
			delay = {
				completion = 10,
				info = 50,
				signature = 50,
			},
			window = {
				info = {
					height = 25,
					width = 80,
					border = "none",
				},
				signature = {
					height = 25,
					width = 80,
					border = "none",
				},
			},
			lsp_completion = {
				source_func = "completefunc",
				-- source_func = "omnifunc",
				auto_setup = true,
			},
		},
		-- config = function(_, opts)
		-- 	require("mini.completion").setup(opts)
		-- end,
	},
	{
		"echasnovski/mini.diff",
		enabled = true,
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("mini.diff").setup()
			vim.api.nvim_set_keymap("n", "<leader>o", ":lua MiniDiff.toggle_overlay()<CR>", { noremap = true })
		end,
	},
	{
		"echasnovski/mini.files",
		lazy = true,
		event = "VeryLazy",
		keys = "<C-t>",
		dependencies = "echasnovski/mini.icons",
		init = function()
			local m = require("mini.files")
			vim.keymap.set("n", "<C-t>", function()
				if m.close() == nil then
					m.open()
				end
			end)
		end,
		opts = {
			windows = {
				preview = true,
				width_preview = 60,
			},
		},
	},
	{
		"echasnovski/mini.fuzzy",
		lazy = true,
		event = "VeryLazy",
		opts = {},
	},
	{
		"echasnovski/mini-git",
		lazy = true,
		event = "CmdlineEnter",
		config = function()
			require("mini.git").setup()
		end,
	},
	{
		"echasnovski/mini.icons",
		lazy = true,
		event = "VeryLazy",
		opts = {},
	},
	{
		"echasnovski/mini.indentscope",
		lazy = true,
		event = "VeryLazy",
		opts = {
			symbol = "▏",
			draw = {
				delay = 5,
				animation = function()
					return 0
				end,
			},
			options = {
				try_as_border = true,
			},
		},
	},
	{
		"echasnovski/mini.notify",
		lazy = true,
		event = "VeryLazy",
		opts = {
			lsp_progress = {
				enable = true,
				duration_last = 100,
			},
			window = {
				config = {},
				winblend = 100,
			},
		},
	},
	{
		"echasnovski/mini.pairs",
		enabled = false,
		lazy = true,
		event = "VeryLazy",
		opts = {},
	},
	{
		"echasnovski/mini.pick",
		lazy = true,
		event = "VeryLazy",
		cmd = "Pick",
		keys = { "leader" },
		opts = {
			options = { use_cache = true },
		},
		config = function(_, opts)
			local mp = require("mini.pick")
			mp.setup(opts)
			local builtin = mp.builtin
			local k = vim.keymap.set
			k("n", "<leader>f", builtin.files, {})
			k("n", "<leader>g", builtin.grep_live, {})
			k("n", "<leader>h", builtin.help, {})
			k("n", "<leader>b", builtin.buffers, {})
		end,
	},
	{
		"echasnovski/mini.splitjoin",
		lazy = true,
		keys = "gS",
		opts = {},
	},
	{
		"echasnovski/mini.statusline",
		lazy = true,
		event = "VeryLazy",
		version = false,
		config = function()
			local m = require("mini.statusline")
			local diag_signs = { ERROR = "!", WARN = "?", INFO = "@", HINT = "*" }
			local my_content = function()
				local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
				local git = MiniStatusline.section_git({ trunc_width = 40 })
				local diff = MiniStatusline.section_diff({ trunc_width = 75 })
				-- local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
				local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75, signs = diag_signs })
				-- local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
				local filename = MiniStatusline.section_filename({ trunc_width = 140 })
				-- local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
				local location = MiniStatusline.section_location({ trunc_width = 75 })
				local search = MiniStatusline.section_searchcount({ trunc_width = 75 })

				return MiniStatusline.combine_groups({
					{ hl = mode_hl, strings = { mode } },
					{ hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics, lsp } },
					"%<", -- Mark general truncate point
					{ hl = "MiniStatuslineFilename", strings = { filename } },
					"%=", -- End left alignment
					{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
					{ hl = mode_hl, strings = { search, location } },
				})
			end
			m.setup({
				content = {
					active = my_content,
				},
			})
		end,
	},
	{
		"echasnovski/mini.surround",
		enabled = true,
		lazy = true,
		event = "VeryLazy",
		opts = {},
	},
	{
		"echasnovski/mini.tabline",
		lazy = true,
		event = "VeryLazy",
		opts = {},
	},
}
