return require('packer').startup(function(use)
	use {
		'wbthomason/packer.nvim',
	}
	use { -- Cacher for performance
		'lewis6991/impatient.nvim',
		config = function() require('configs.impatient') end
	}
	use {
		'norcalli/nvim-colorizer.lua',
		config = function() require('configs.colorizer') end
	}
	use {
		'nvim-tree/nvim-tree.lua',
		opt = true,
		cmd = {'NvimTreeToggle'},
		config = function() require('configs.nvim-tree') end,
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
		config = function() require('configs.nvim-surround') end
	}
	-- use 'tpope/vim-surround'
	use {
		'windwp/nvim-autopairs',
		config = function() require('configs.autopairs') end
	}
	use {
		'numToStr/Comment.nvim',
		config = function() require('configs.comment') end
	}
	use {
	-- Greeter Dashboard
		'goolord/alpha-nvim',
		opt = true,
		cmd = {
			'Alpha',
			'AlphaRedraw'
		},
		config = function() require('configs.alpha') end
	}
	use {-- Text Highlighter
		'RRethy/vim-illuminate',
		config = function() require('configs.illuminate') end
	}
	use {
		'lukas-reineke/indent-blankline.nvim',
		config = function() require('configs.indent_blankline') end
	}
	use {'nvim-telescope/telescope.nvim',
		requires = 'nvim-lua/plenary.nvim',
		config = function() require('configs.telescope') end
	}
	use {
		'p00f/nvim-ts-rainbow',
		config = function() require('configs.nvim-ts-rainbow') end
	}
	use {
		'nvim-treesitter/nvim-treesitter',
		after = 'nvim-ts-rainbow',
		config = function() require('configs.treesitter') end,
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
		config = function() require('configs.codewindow') end
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
	-- use 'rhysd/clever-f.vim' -- use of Ff and Tt without ;
	-- use 'chentoast/marks.nvim' -- easier marks
	use {
		'folke/noice.nvim',
		-- disabled = true,
		after = 'nvim-cmp',
		requires = {
			{
				'MunifTanjim/nui.nvim'
				-- disabled = true,
			},
		},
		config = function() require('configs.noice') end
	}
	use {
		'folke/which-key.nvim',
		config = function() require('configs.whichkey') end
	}
	-- use {
	-- 	'olimorris/onedarkpro.nvim',
	-- 	config = function() require('theme') end,
	-- 	requires = {
	-- 		{
	-- 			'nvim-lualine/lualine.nvim',
	-- 			config = function() require('configs.lualine') end
	-- 		},
	-- 		{
	-- 			'lewis6991/gitsigns.nvim',
	-- 			config = function() require('configs.gitsigns') end
	-- 		}
	-- 	}
	-- }
	use {
		'navarasu/onedark.nvim',
		config = function() require('theme') end,
		requires = {
			{
				'nvim-lualine/lualine.nvim',
				requires = {
					'noice.nvim'
				},
				config = function() require('configs.lualine') end
			},
			{
				'lewis6991/gitsigns.nvim',
				config = function() require('configs.gitsigns') end
			}
		}
	}
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
		config = function() require('configs.mason-dap') end,
	}
	-- use 'mfussenegger/nvim-dap' -- DAP plugin
	use {
		'williamboman/mason-lspconfig.nvim',
		opt = true,
		after = {'mason.nvim', 'nvim-lspconfig'},
		config = function() require('mason-lspconfig').setup() end
	}
	-- Autocompletion configs.
		-- Integrater for Mason and lspconfig
	use {
		'hrsh7th/cmp-nvim-lsp',
		after = 'nvim-lspconfig',
		config = function() require('configs.nvim_lsp') end
	}
	-- use 'hrsh7th/cmp-buffer'
	-- use 'hrsh7th/cmp-path'
	-- use 'hrsh7th/cmp-cmdline'
	-- use 'hrsh7th/cmp-vsnip'
	use {
		'hrsh7th/nvim-cmp',
		after = 'nvim-treesitter',
		requires = {
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'hrsh7th/cmp-cmdline'},
			{'hrsh7th/cmp-nvim-lsp-signature-help'},
			{'onsails/lspkind.nvim'},
			{
				'hrsh7th/cmp-vsnip',
				requires = 'hrsh7th/vim-vsnip'
			}
		},
		config = function() require('configs.nvim_cmp') end,
	}
	use {
		'zbirenbaum/neodim',
		after = 'nvim-treesitter',
		config = function() require('configs.neodim') end,
	}

	-- Removed/Disabled Plugins
	-- Plug 'mg979/vim-visual-multi' -- multiple cursors
	-- Plug 'kdheepak/lazygit.nvim' -- LazyGit
end)
