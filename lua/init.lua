local Plug = vim.fn['plug#']

-- Plug 'vim-airline/vim-airline' --Status Bar
vim.call('plug#begin')

Plug 'norcalli/nvim-colorizer.lua' -- Colorizer
Plug 'preservim/nerdtree' --NerdTree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' -- NerdTree Coloring
Plug 'kyazdani42/nvim-web-devicons' -- icons for NERDTree
Plug 'ryanoasis/vim-devicons' --Developer Icons
Plug 'akinsho/toggleterm.nvim' -- Terminal Toggler
Plug 'preservim/tagbar' --Tagbar for code (NERDTree Dependency)
Plug 'tpope/vim-surround' --Surrounding ysw)
Plug('navarasu/onedark.nvim', {on = 'Onedark', ['for'] = 'onedark'}) --Atom Dark Colorscheme
Plug 'windwp/nvim-autopairs' --Auto-Pair completion
Plug 'lukas-reineke/indent-blankline.nvim' -- Indentation Lines
Plug 'numToStr/Comment.nvim' -- Commenter
Plug 'nvim-lualine/lualine.nvim' -- Statusline
Plug 'goolord/alpha-nvim' -- Greeter Dashboard
Plug 'lewis6991/impatient.nvim' -- Cacher for performance
Plug 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
Plug 'williamboman/nvim-lsp-installer' -- LSP Easy Installer
Plug 'RRethy/vim-illuminate' -- Text Highlighter
Plug 'nvim-lua/plenary.nvim' -- Coroutines for Telescope and GitSigns
Plug 'nvim-telescope/telescope.nvim' -- fzf
Plug 'nvim-treesitter/nvim-treesitter' -- Treesitter
Plug 'nvim-treesitter/playground' -- Treesitter playground
Plug 'folke/which-key.nvim' --WhichKey popup suggestions
Plug 'p00f/nvim-ts-rainbow' -- Rainbow Brackets
Plug 'Vimjas/vim-python-pep8-indent' -- Python proper indentation
Plug 'mg979/vim-visual-multi' -- multiple cursors
Plug 'davepinto/virtual-column.nvim' -- Thinner ruler-guide
Plug 'gorbit99/codewindow.nvim' -- Minimap Sidebar

-- Git
Plug 'lewis6991/gitsigns.nvim' -- Signs for changes to file
Plug 'kdheepak/lazygit.nvim' -- LazyGit

-- Autocompletion plugins:
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug "hrsh7th/cmp-nvim-lsp-signature-help"

vim.call('plug#end')

vim.opt.termguicolors = true

require('onedark').setup {
    style = 'darker',
    -- transparent = true,
    code_style = {
        comments = "italic",
        keywords = "italic",
    },
    lualine = {
        -- transparent = true
    },
	highlights = {
        -- ["@property"] = {fg = "#abb2bf"},
        -- ['@namespace'] = {fg = '#535965', fmt = 'italic'},
        ["@parameter"] = {fg = '#cc9057'},
        ["@keyword.operator"] = {fmt = 'bold'},
	}
    }
}
require('onedark').load()

vim.cmd [[highlight CursorLineNr guifg=#4fa6ed gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#313640 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineContextChar guifg=#4fa6ed gui=nocombine]]
vim.api.nvim_set_hl(0, 'FloatBorder', {fg = '#4fa6ed'}) -- coloring for codewindow

require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = false,
    use_treesitter = true,
    char_highlight_list = {
        "IndentBlanklineIndent1"
    }
}

require('toggleterm').setup {
    close_on_exit = true,
    persist_mode = false
}
require('gitsigns').setup()
require("codewindow").setup()
require("codewindow").apply_default_keybinds()
require('colorizer').setup()
require('nvim-autopairs').setup {}
require('Comment').setup {}
require('alpha').setup(require('alpha.themes.dashboard').config)
require('impatient')
require("nvim-lsp-installer").setup {}
require("which-key").setup {}
require('lualine').setup {
	options = { theme = 'onedark' },
}
require("illuminate").configure({
	providers = {
		'lsp',
		'regex'
	},
	delay = 100,
	under_cursor = true
})
require("nvim-treesitter.configs").setup {
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    rainbow = {
        enable = true,
        -- colors = {},
        -- termcolors = {},
        extended_mode = false,
        max_file_lines = nil,
    },
    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
          toggle_query_editor = 'o',
          toggle_hl_groups = 'i',
          toggle_injected_languages = 't',
          toggle_anonymous_nodes = 'a',
          toggle_language_display = 'I',
          focus_language = 'f',
          unfocus_language = 'F',
          update = 'R',
          goto_node = '<cr>',
          show_help = '?',
        },
    }
}
-- require('virtual-column').init({
--    column_number = 80,
--    overlay = true,
--    vert_char = "│",
--    enabled = true,
--
--     -- do not show column on this buffers and types
--    buftype_exclude = {},
--    filetype_exclude = {},
-- })
