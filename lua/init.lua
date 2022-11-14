local Plug = vim.fn['plug#']

-- Plug 'vim-airline/vim-airline' --Status Bar
vim.call('plug#begin')

Plug 'norcalli/nvim-colorizer.lua' -- Colorizer
Plug 'nvim-tree/nvim-tree.lua' -- File Explorer
Plug 'kyazdani42/nvim-web-devicons' -- icons for NERDTree and NvimTree
Plug 'preservim/tagbar' --Tagbar for code
Plug 'ryanoasis/vim-devicons' --Developer Icons
Plug 'akinsho/toggleterm.nvim' -- Terminal Toggler
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
Plug 'p00f/nvim-ts-rainbow' -- Rainbow Brackets
Plug 'Vimjas/vim-python-pep8-indent' -- Python proper indentation
Plug 'gorbit99/codewindow.nvim' -- Minimap Sidebar

-- SQL
Plug 'tpope/vim-dadbod' -- SQL interface
Plug 'kristijanhusak/vim-dadbod-ui' -- dadbod UI 

-- Git
Plug 'lewis6991/gitsigns.nvim' -- Signs for changes to file

-- Autocompletion plugins:
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug "hrsh7th/cmp-nvim-lsp-signature-help"

-- Removed/Disabled Plugins
-- Plug 'preservim/nerdtree' --NerdTree
-- Plug 'tiagofumo/vim-nerdtree-syntax-highlight' -- NerdTree Coloring
-- Plug 'voldikss/vim-floaterm' -- floating windows (lf.vim dependency)
-- Plug 'ptzz/lf.vim' -- LF integration
-- Plug 'folke/which-key.nvim' --WhichKey popup suggestions
-- Plug 'mg979/vim-visual-multi' -- multiple cursors
-- Plug 'davepinto/virtual-column.nvim' -- Thinner ruler-guide
-- Plug 'kdheepak/lazygit.nvim' -- LazyGit

vim.call('plug#end')

-- Disabling builtin explorer
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- for highlight group enabling
vim.opt.termguicolors = true


-- Navarasu OneDark theme
require('onedark').setup {
	style = 'darker',
    transparent = true,

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
        -- ["@text"] = {fg = '#ff0000', fmt = 'underline'},
        ["@parameter"] = {fg = '#cc9057'},
        ["@keyword.operator"] = {fmt = 'bold'},
	}
}
require('onedark').load()

vim.cmd [[highlight CursorLineNr guifg=#4fa6ed gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#313640 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineContextChar guifg=#4fa6ed gui=nocombine]]

require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = false,
    use_treesitter = true,
    use_treesitter_scope = true,
    char_highlight_list = {
        "IndentBlanklineIndent1"
    }
}
vim.api.nvim_set_hl(0, 'FloatBorder', {fg = '#4fa6ed', bg='#151820'}) -- coloring for codewindow
vim.api.nvim_set_hl(0, 'NormalFloat', {fg = '#4fa6ed', bg='#151820'}) -- coloring for codewindow
require("codewindow").setup ({
    auto_enable = false,
    minimap_width = 15,
    window_border = 'single',
    -- width_multiplier = 4,
    -- show_cursor = false,
})


vim.api.nvim_set_hl(0, 'CodewindowBorder', {fg = '#4fa6ed'})
vim.api.nvim_set_hl(0, 'CodewindowBackground', {fg = '#4fa6ed'})




require("codewindow").apply_default_keybinds()
require('toggleterm').setup {}
require('gitsigns').setup()
require('colorizer').setup()
require('nvim-autopairs').setup {}
require('Comment').setup {}
require('alpha').setup(require('alpha.themes.dashboard').config)
require('impatient')
-- require("which-key").setup {}
require('telescope').setup {
  pickers = {
    find_files = {
      mappings = {
        i = {
          ["<C-j>"] = "move_selection_next",
          ["<C-k>"] = "move_selection_previous"
        },
        n = {
          ["<C-j>"] = "move_selection_next",
          ["<C-k>"] = "move_selection_previous"
        },
      },
    },
  },
}

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

require("nvim-tree").setup({
  view = {
    mappings = {
      list = {
        { key = "<C-[>", action = "dir_up" },
        { key = "<C-s>", action = "split" },
      },
    },
  },
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
