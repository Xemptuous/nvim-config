return {
	{
		"echasnovski/mini.statusline",
		lazy = true,
		event = "VeryLazy",
		version = false,
		config = function()
			require("mini.statusline").setup()
		end,
	},
	{
		"echasnovski/mini-git",
		lazy = true,
		event = "VeryLazy",
		version = false,
		config = function()
			require("mini.git").setup()
		end,
	},
	{
		"echasnovski/mini.diff",
		version = false,
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("mini.diff").setup()
		end,
	},
	{
		"echasnovski/mini.ai",
		version = false,
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("mini.ai").setup()
		end,
	},
	{
		"echasnovski/mini.fuzzy",
		version = false,
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("mini.fuzzy").setup()
		end,
	},
	{
		"echasnovski/mini.bufremove",
		version = false,
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("mini.bufremove").setup()
		end,
	},
	{
		"echasnovski/mini.tabline",
		version = false,
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("mini.tabline").setup()
		end,
	},
	{
		"echasnovski/mini.files",
		version = false,
		lazy = true,
		event = "VeryLazy",
		keys = "<C-t>",
		dependencies = {
			{
				"echasnovski/mini.icons",
				version = false,
				lazy = true,
				event = "VeryLazy",
				config = function()
					require("mini.icons").setup()
				end,
			},
		},
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
		config = function(_, opts)
			require("mini.files").setup(opts)
		end,
	},
	{
		"echasnovski/mini.fuzzy",
		version = false,
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("mini.fuzzy").setup()
		end,
	},
	{
		"echasnovski/mini.pairs",
		version = false,
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("mini.pairs").setup()
		end,
	},
	{
		"echasnovski/mini.surround",
		version = false,
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("mini.surround").setup()
		end,
	},
	{
		"echasnovski/mini.pick",
		version = false,
		lazy = true,
		event = "VeryLazy",
		opts = {
			options = { use_cache = true },
		},
		config = function(_, opts)
			require("mini.pick").setup(opts)
		end,
	},
	{
		"echasnovski/mini.splitjoin",
		version = false,
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("mini.splitjoin").setup()
		end,
	},
	{
		"echasnovski/mini.comment",
		version = false,
		lazy = true,
		keys = { "gc", "V" },
		config = function()
			require("mini.comment").setup()
		end,
	},
	{
		"echasnovski/mini.indentscope",
		version = false,
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
		config = function(_, opts)
			require("mini.indentscope").setup(opts)
		end,
	},
}
