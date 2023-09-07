local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	print("Lazy not found. Cloning repo...")
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"catppuccin/nvim",
		priority = 900,
		config = function() require("theme") end,
	},
	{
		"nvim-lualine/lualine.nvim",
		lazy = true,
		event = "VeryLazy",
		opts = { options = { theme = "nightfly" } },
	},
	{
		"williamboman/mason.nvim",
		priority = 850,
		config = function() require("plugins.mason") end,
	},
	{
		"neovim/nvim-lspconfig",
		priority = 800,
		lazy = true,
		event = { "BufReadPost", "BufNewFile" },
		config = function() require("plugins.nvim_lsp") end,
	},
	{
		"hrsh7th/nvim-cmp",
		lazy = true,
		event = { "InsertEnter", "CmdlineEnter" },
		config = function() require("plugins.nvim_cmp") end,
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"onsails/lspkind.nvim",
			"L3MON4D3/LuaSnip",
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		priority = 700,
		config = function() require("plugins.treesitter") end,
		dependencies = "HiPhish/rainbow-delimiters.nvim",
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
		lazy = true,
		config = function() require("plugins.rainbow-delimiters") end
	},
	{
		"nvimdev/lspsaga.nvim",
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("keymaps.lspsaga")
		end,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"nvim-treesitter/nvim-treesitter",
		},
	},
	{
		"mhartington/formatter.nvim",
		lazy = true,
		cmd = { "Format", "FormatWrite" },
		config = function() require("plugins.formatter") end,
		init = function()
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				pattern = { "*" },
				command = "FormatWrite",
			})
		end,
	},
	{
		"mfussenegger/nvim-lint",
		config = function() require("plugins.nvim-lint") end,
		init = function()
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
	{ "michaelb/sniprun" },
	{
		"xemptuous/sqlua.nvim",
		enabled = false,
		config = function() require("sqlua").setup() end,
	},
	{
		"m00qek/baleia.nvim",
		lazy = true,
		cmd = { "BaleiaColorize" },
		config = function() require("baleia").setup({}) end,
	},
	{
		"lewis6991/gitsigns.nvim",
		lazy = true,
		event = "VeryLazy",
		config = function() require("gitsigns").setup() end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		lazy = true,
		event = "VeryLazy",
		config = function() require("plugins.indent_blankline") end,
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
	{
		"nvim-tree/nvim-tree.lua",
		lazy = true,
		cmd = { "VimEnter", "NvimTreeToggle" },
		keys = "<C-t>",
		config = function()
			require("keymaps.nvimtree")
			require("plugins.nvim-tree")
		end,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"kylechui/nvim-surround",
		lazy = true,
		keys = { "ys", "yS" },
		config = function() require("nvim-surround").setup() end,
	},
	{
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup({}) end,
	},
	{
		"numToStr/Comment.nvim",
		lazy = true,
		keys = { "gc", "V" },
		config = function() require("Comment").setup() end,
	},
	{
		"nvim-telescope/telescope.nvim",
		lazy = true,
		-- event = "VeryLazy",
		-- cmd = "Telescope",
		keys = "<leader>t",
		config = function()
			require("keymaps.telescope")
			require("plugins.telescope")
		end,
		dependencies = "nvim-lua/plenary.nvim",
	},
	{
		"Vimjas/vim-python-pep8-indent",
		lazy = true,
		ft = { "python", "py" },
	},
	{ -- Minimap Sidebar
		"gorbit99/codewindow.nvim",
		lazy = true,
		keys = "<leader>mm",
		config = function() require("plugins.codewindow") end,
	},
	{ -- autoclose html tags
		"alvan/vim-closetag",
		lazy = true,
		ft = { "html", "djangohtml", "htmldjango" },
	},
	{ -- r/w with sudo
		"lambdalisue/suda.vim",
		lazy = true,
		cmd = "SudaWrite",
	},
	{
		"kristijanhusak/vim-dadbod-ui",
		lazy = true,
		cmd = "DBUI",
		dependencies = { "tpope/vim-dadbod" },
	},
	{
		"simrat39/rust-tools.nvim",
		lazy = true,
		ft = "rust",
		config = function() require("plugins.rust-tools") end,
	},
	{
		"folke/flash.nvim",
		lazy = true,
		keys = {
			{ "s", mode = { "n", "o", "x" }, function() require("flash").jump() end },
			{ "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end },
			{ "r", mode = "o", function() require("flash").remote() end },
			{ "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end },
			{ "<c-s>", mode = { "c" }, function() require("flash").toggle() end},
		},
		config = function()
			vim.api.nvim_set_hl(0, "FlashMatch", { fg = "#89b4fa" })
			vim.api.nvim_set_hl(0, "FlashCurrent", { fg = "#a6e3a1" })
			vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#11111b", bg = "#f38ba8" })
		end
	},
	-- {
	-- 	"mrjones2014/legendary.nvim",
	-- 	enabled = false,
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		require("plugins.legendary")
	-- 	end,
	-- },
	-- {
	-- 	"ellisonleao/glow.nvim",
	-- 	enabled = false,
	-- 	config = function()
	-- 		require("glow").setup({ border = "single" })
	-- 	end,
	-- 	cmd = "Glow",
	-- },
	-- {
	-- 	"williamboman/mason-lspconfig.nvim",
	-- 	enabled = false,
	-- 	lazy = true,
	-- 	config = function()
	-- 		require("mason-lspconfig").setup()
	-- 	end,
	-- },
	-- {
	-- 	"rebelot/kanagawa.nvim",
	-- 	enabled = false,
	-- 	lazy = false,
	-- 	priority = 900,
	-- 	config = function()
	-- 		require("theme")
	-- 	end,
	-- },
	-- {
	-- 	"navarasu/onedark.nvim",
	-- 	enabled = false,
	-- 	lazy = false,
	-- 	priority = 900,
	-- 	config = function()
	-- 		require("theme")
	-- 	end,
	-- },
	-- {
	--   'mfussenegger/nvim-dap',
	--   lazy = true,
	--   keys = "<leader>d",
	--   cmd = {"DapToggleBreakpoint", "DapToggleRepl"},
	--   config = function() require('keymaps.dap') end,
	--   dependencies = {
	--     'jay-babu/mason-nvim-dap.nvim',
	--     'williamboman/mason.nvim'
	--   }
	-- },
	-- {
	--   'jay-babu/mason-nvim-dap.nvim',
	--   lazy = true,
	--   config = function() require('plugins.mason-dap') end,
	--   dependencies = {'williamboman/mason.nvim'}
	-- },
	-- {
	-- 	"glepnir/dashboard-nvim",
	-- 	enabled = false,
	-- 	event = "VimEnter",
	-- 	config = function()
	-- 		require("plugins.dashboard")
	-- 	end,
	-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- },
	-- {
	--   'yuratomo/w3m.vim',
	--   enabled = false,
	--   lazy = true,
	--   cmd = {"W3m"},
	--   keys = {"<leader>w"},
	--   config = function() require('keymaps.w3m') end
	-- },
	-- {
	-- 	"hrsh7th/cmp-nvim-lsp",
	-- 	-- dependencies = { "RRethy/vim-illuminate", "simrat39/rust-tools.nvim" },
	-- },
	-- {
	-- 	"folke/which-key.nvim",
	-- 	enabled = false,
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		require("keymaps.whichkey")
	-- 		require("which-key").setup()
	-- 	end,
	-- },
	-- {
	-- 	"zbirenbaum/neodim",
	-- 	enabled = false,
	-- 	lazy = true,
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		require("plugins.neodim")
	-- 	end,
	-- 	dependencies = { "nvim-treesitter" },
	-- },
	-- {
	-- 	"stevearc/dressing.nvim",
	-- 	enabled = false,
	-- 	config = function()
	-- 		require("plugins.dressing")
	-- 	end,
	-- },
	-- {
	-- 	"norcalli/nvim-colorizer.lua",
	-- 	enabled = false,
	-- 	config = function()
	-- 		require("colorizer").setup()
	-- 	end,
	-- },
	-- {
	-- 	"preservim/tagbar",
	-- 	enabled = false,
	-- 	lazy = true,
	-- 	cmd = { "TagbarToggle" },
	-- },
	-- {
	-- 	"akinsho/toggleterm.nvim",
	-- 	enabled = false,
	-- 	lazy = true,
	-- 	cmd = { "ToggleTerm" },
	-- 	keys = { "<A-t>", "<A-v>" },
	-- 	-- init = function() require('keymaps.toggleterm') end,
	-- 	config = function()
	-- 		require("keymaps.toggleterm")
	-- 		require("toggleterm").setup()
	-- 	end,
	-- },
	-- { -- Text Highlighter
	-- 	"RRethy/vim-illuminate",
	-- 	enabled = false,
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		require("plugins.illuminate")
	-- 	end,
	-- },
	-- {
	-- 	"nvim-treesitter/playground",
	-- 	enabled = false,
	-- 	lazy = true,
	-- 	cmd = { "TsPlaygroundToggle" },
	-- },
}, {
	install = {
		colorscheme = { "catppuccin" },
	},
})
