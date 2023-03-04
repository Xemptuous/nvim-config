local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  print('Lazy not found. Cloning repo...')
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
    'lewis6991/impatient.nvim',
    priority = 1000,
    config = function() require('impatient') end,
  },
  {
    'catppuccin/nvim',
    enabled = true,
    lazy = false,
    priority = 900,
    config = function() require('theme') end
  },
  {
    'rebelot/kanagawa.nvim',
    enabled = false,
    lazy = false,
    priority = 900,
    config = function() require('theme') end
  },
	{
		'navarasu/onedark.nvim',
    enabled = false,
    lazy = false,
    priority = 900,
		config = function() require('theme') end,
	},
  {
    'glepnir/dashboard-nvim',
    enabled = false,
    event = 'VimEnter',
    config = function() require('plugins.dashboard') end,
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  {
    'lewis6991/gitsigns.nvim',
    lazy = true,
    event = "VeryLazy",
    config = function() require('gitsigns').setup() end,
  },
  {
    'nvim-lualine/lualine.nvim',
    lazy = true,
    event = 'VeryLazy',
    opts = { options = { theme = 'nightfly' } },
    -- dependencies = {'noice.nvim'},
  },
  {
    'zbirenbaum/neodim',
    lazy = true,
    event = 'VeryLazy',
    config = function() require('plugins.neodim') end,
    dependencies = {'nvim-treesitter'},
  },
	{
		'lukas-reineke/indent-blankline.nvim',
    -- lazy = true,
    event = 'VeryLazy',
		config = function() require('plugins.indent_blankline') end,
    dependencies = {'nvim-treesitter/nvim-treesitter'}
	},
	{
		'folke/which-key.nvim',
    enabled = false,
    event = 'VeryLazy',
		config = function()
      require('keymaps.whichkey')
      require("which-key").setup()
    end
	},
  {
    'mrjones2014/legendary.nvim',
    event = 'VeryLazy',
    config = function() require('plugins.legendary') end
  },
  {
    'stevearc/dressing.nvim',
    config = function() require('plugins.dressing') end
  },
  {
    'glepnir/lspsaga.nvim',
    lazy = false,
    -- event = "BufRead",
    config = function() require('keymaps.lspsaga') end,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-treesitter/nvim-treesitter"
    }
  },
	{
		'norcalli/nvim-colorizer.lua',
    -- lazy = true,
    event = 'VeryLazy',
    config = function() require('colorizer').setup() end,
	},
	{
		'nvim-tree/nvim-tree.lua',
		lazy = true,
    cmd = { "VimEnter" },
		-- cmd = {'NvimTreeToggle'},
  --   keys = '<C-t>',
		config = function()
      require('keymaps.nvimtree')
      require('plugins.nvim-tree')
    end,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
	},
	{
		'preservim/tagbar',
    enabled = false,
		lazy = true,
		cmd = {'TagbarToggle'}
	},
	{
		'akinsho/toggleterm.nvim',
    enabled = false,
		lazy = true,
		cmd = {'ToggleTerm'},
    keys = {'<A-t>', '<A-v>'},
    -- init = function() require('keymaps.toggleterm') end,
    config = function()
      require('keymaps.toggleterm')
      require('toggleterm').setup()
    end
	},
	{
    'kylechui/nvim-surround',
    lazy = true,
    keys = {'ys', 'yS'},
    config = function() require('nvim-surround').setup() end,
	},
	{
    'windwp/nvim-autopairs',
    lazy = false,
    config = function() require('nvim-autopairs').setup {} end,
  },
	{
		'numToStr/Comment.nvim',
    lazy = true,
    keys = {'gc', 'V'},
    config = function() require('Comment').setup() end,
	},
	{-- Text Highlighter
		'RRethy/vim-illuminate',
    event = 'VeryLazy',
		config = function() require('plugins.illuminate') end
	},
	{
    'nvim-telescope/telescope.nvim',
    lazy = true,
    cmd = 'Telescope',
    keys = '<leader>t',
    -- init = function() require('keymaps.telescope') end,
		config = function()
      require('keymaps.telescope')
      require('plugins.telescope')
    end,
		dependencies = 'nvim-lua/plenary.nvim',
	},
	{ -- Treesitter playground
		'nvim-treesitter/playground',
		lazy = true,
		cmd = {'TsPlaygroundToggle'}
	},
	{
		'Vimjas/vim-python-pep8-indent',
		lazy = true,
		ft = {'python', 'py'}
	},
	{ -- Minimap Sidebar
		'gorbit99/codewindow.nvim',
		lazy = true,
		keys = '<leader>mm',
		config = function() require('plugins.codewindow') end
	},
	{ -- autoclose html tags
		'alvan/vim-closetag',
		lazy = true,
		ft = {'html', 'djangohtml', 'htmldjango'}
	},
	{ -- r/w with sudo
		'lambdalisue/suda.vim',
		lazy = true,
		cmd = 'SudaWrite'
	},
	{
		'kristijanhusak/vim-dadbod-ui',
		lazy = true,
		cmd = 'DBUI',
		dependencies = {'tpope/vim-dadbod'}
	},
	{ -- LSP, DAP, Linter, Formatter manager
		'williamboman/mason.nvim',
		config = function() require('plugins.mason') end,
	},
  {
    'mfussenegger/nvim-dap',
    lazy = true,
    keys = "<leader>d",
    cmd = {"DapToggleBreakpoint", "DapToggleRepl"},
    config = function() require('keymaps.dap') end,
    dependencies = {
      'jay-babu/mason-nvim-dap.nvim',
      'williamboman/mason.nvim'
    }
  },
  {
    'jay-babu/mason-nvim-dap.nvim',
    lazy = true,
    config = function() require('plugins.mason-dap') end,
    dependencies = {'williamboman/mason.nvim'}
  },
  {
    'mhartington/formatter.nvim',
    lazy = true,
    cmd = {'Format', 'FormatWrite'},
    config = function() require('plugins.formatter') end,
  },
	{
		'williamboman/mason-lspconfig.nvim',
		lazy = true,
		config = function() require('mason-lspconfig').setup() end
	},
	{
		'mrjones2014/nvim-ts-rainbow',
    enabled = false,
    lazy = true,
		config = function() require('plugins.nvim-ts-rainbow') end
	},
	{
		'nvim-treesitter/nvim-treesitter',
    lazy = false,
		config = function() require('plugins.treesitter') end,
    dependencies = {'mrjones2014/nvim-ts-rainbow'}
	},
	{
		'nvim-treesitter/playground',
		lazy = true,
		cmd = {'TsPlaygroundToggle'},
	},
	{
		'hrsh7th/cmp-nvim-lsp',
		config = function() require('plugins.nvim_lsp') end,
	},
  {
    'neovim/nvim-lspconfig',
    lazy = true,
    event = 'VeryLazy',
    config = function() require('lspconfig') end,
  },
	{
		'hrsh7th/nvim-cmp',
    lazy = true,
    event = {"InsertEnter", "CmdlineEnter"},
		config = function() require('plugins.nvim_cmp') end,
		dependencies = {
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'hrsh7th/cmp-nvim-lsp-signature-help',
			'onsails/lspkind.nvim',
      "L3MON4D3/LuaSnip",
		},
	},
  -- {
  --   'yuratomo/w3m.vim',
  --   enabled = false,
  --   lazy = true,
  --   cmd = {"W3m"},
  --   keys = {"<leader>w"},
  --   config = function() require('keymaps.w3m') end
  -- },
  {
    'xemptuous/sqlua.nvim',
    config = function() require('sqlua').setup() end
  }
},
  {
  install = {
      colorscheme = { 'catppuccin' }
    }
  })
