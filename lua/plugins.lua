return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use { -- Cacher for performance
		'lewis6991/impatient.nvim',
		config = function() require('plugins.impatient') end
	}
	use {
		'norcalli/nvim-colorizer.lua',
		config = function() require('plugins.colorizer') end
	}
	use {
		'nvim-tree/nvim-tree.lua',
		opt = true,
		cmd = {'NvimTreeToggle'},
		config = function() require('plugins.nvim-tree') end,
	}
	use {
		'nvim-tree/nvim-web-devicons',
		opt = true,
		after = 'nvim-tree.lua',
		requires = 'nvim-tree.lua'
	}
	use {
		'preservim/tagbar',
		opt = true,
		cmd = {'TagbarToggle'}
	}
	use {
		'akinsho/toggleterm.nvim',
		opt = true,
		cmd = {'ToggleTerm'}
	}
	use {
		'kylechui/nvim-surround',
		config = function() require('plugins.nvim-surround') end
	}
	-- use 'tpope/vim-surround'
	use {
		'windwp/nvim-autopairs',
		config = function() require('plugins.autopairs') end
	}
	use {
		'numToStr/Comment.nvim',
		config = function() require('plugins.comment') end
	}
	use {
	-- Greeter Dashboard
		'goolord/alpha-nvim',
		opt = true,
		cmd = {
			'Alpha',
			'AlphaRedraw'
		},
		config = function() require('plugins.alpha') end
	}
	use {-- Text Highlighter
		'RRethy/vim-illuminate',
		config = function() require('plugins.illuminate') end
	}
	use {
		'lukas-reineke/indent-blankline.nvim',
		config = function() require('plugins.indent_blankline') end
	}
	use {'nvim-telescope/telescope.nvim',
		requires = 'nvim-lua/plenary.nvim',
		config = function() require('plugins.telescope') end
	}
	use {
		'p00f/nvim-ts-rainbow',
		config = function() require('plugins.nvim-ts-rainbow') end
	}
	use {
		'nvim-treesitter/nvim-treesitter',
		after = 'nvim-ts-rainbow',
		config = function() require('plugins.treesitter') end,
	}
	use {
		'nvim-treesitter/playground',
		opt = true,
		cmd = {'TsPlaygroundToggle'},
		requires = 'nvim-treesitter'
	}
	-- use { -- Treesitter playground
	-- 	'nvim-treesitter/playground',
	-- 	opt = true,
	-- 	cmd = {'TsPlaygroundToggle'}
	-- }
	-- use 'p00f/nvim-ts-rainbow' -- Rainbow Brackets
	use {
		'Vimjas/vim-python-pep8-indent',
		opt = true,
		ft = {'python', 'py'}
	}
	use { -- Minimap Sidebar
		'gorbit99/codewindow.nvim',
		opt = true,
		keys = '<leader>mm',
		config = function() require('plugins.codewindow') end
	}
	use { -- autoclose html tags
		'alvan/vim-closetag',
		opt = true,
		ft = {'html', 'djangohtml', 'htmldjango'}
	}
	use { -- r/w with sudo
		'lambdalisue/suda.vim',
		opt = true,
		cmd = 'SudaWrite'
	}
	use 'rhysd/clever-f.vim' -- use of Ff and Tt without ;
	-- use 'chentoast/marks.nvim' -- easier marks
	-- use 'MunifTanjim/nui.nvim' -- component for ui
	-- use 'rcarriga/nvim-notify' -- stylized popup notifications
	use {
		'folke/noice.nvim',
		disable = true,
		requires = {
			{'MunifTanjim/nui.nvim'},
			{
				'rcarriga/nvim-notify',
				config = function() require('plugins.notify') end
			}
		},
		config = function() require('plugins.noice') end
	}
	use {
		'folke/which-key.nvim',
		config = function() require('plugins.whichkey') end
	}
	-- Colorschemes
	use {
		'navarasu/onedark.nvim',
		config = function() require('theme') end,
		requires = {
			{
				'nvim-lualine/lualine.nvim',
				config = function() require('plugins.lualine') end
			},
			{
				'lewis6991/gitsigns.nvim',
				config = function() require('plugins.gitsigns') end
			}
		}
	}
	-- use {
	-- 	'nvim-lualine/lualine.nvim',
	-- 	after = 'onedark.nvim',
	-- 	config = function() require('plugins.lualine') end
	-- }
	-- use {
	-- 	'lewis6991/gitsigns.nvim',
	-- 	after = 'onedark.nvim',
	-- 	config = function() require('plugins.gitsigns') end
	-- }
	-- use {
	-- 	'zbirenbaum/neodim',
	-- 	config = function() require('plugins.neodim') end
	-- }

	use {
		'kristijanhusak/vim-dadbod-ui',
		opt = true,
		cmd = 'DBUI',
		after = 'nvim-treesitter',
		requires = 'tpope/vim-dadbod'
	}

	-- use {
	-- 	'williamboman/mason-lspconfig.nvim',
	-- 	-- cmd = {'Mason'},
	-- 	config = function() require('mason-lspconfig').setup() end
	-- }
	use 'neovim/nvim-lspconfig'
	use { -- LSP, DAP, Linter, Formatter manager
		'williamboman/mason.nvim',
		after = 'nvim-lspconfig',
		config = function() require('mason').setup() end,
		requires = {
			{
				'mfussenegger/nvim-dap',
			}
		}
	}
	use {
		'jay-babu/mason-nvim-dap.nvim',
		opt = true,
		after = 'mason.nvim',
		cmd = "ToggleBreakpoint",
		config = function() require('plugins.mason-dap') end,
	}
	-- use 'mfussenegger/nvim-dap' -- DAP plugin
	use {
		'williamboman/mason-lspconfig.nvim',
		opt = true,
		after = {'mason.nvim', 'nvim-lspconfig'},
		config = function() require('mason-lspconfig').setup() end
	}
	-- Autocompletion plugins:
		-- Integrater for Mason and lspconfig
	use {
		'hrsh7th/cmp-nvim-lsp',
		after = 'nvim-lspconfig',
		config = function() require('plugins.nvim_lsp') end
	}
	-- use 'hrsh7th/cmp-buffer'
	-- use 'hrsh7th/cmp-path'
	-- use 'hrsh7th/cmp-cmdline'
	-- use 'hrsh7th/cmp-vsnip'
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'hrsh7th/cmp-cmdline'},
			{'hrsh7th/cmp-nvim-lsp-signature-help'},
			{
				'hrsh7th/cmp-vsnip',
				requires = 'hrsh7th/vim-vsnip'
			}
		},
		config = function() require('plugins.nvim_cmp') end,
	}
	use 'hrsh7th/vim-vsnip'
	use "hrsh7th/cmp-nvim-lsp-signature-help"
	use {
		'zbirenbaum/neodim',
		after = 'nvim-treesitter',
		config = function() require('plugins.neodim') end,
	}

	-- Removed/Disabled Plugins
	-- Plug 'mg979/vim-visual-multi' -- multiple cursors
	-- Plug 'kdheepak/lazygit.nvim' -- LazyGit
end)
