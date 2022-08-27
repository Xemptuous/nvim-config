local Plug = vim.fn['plug#']

-- Plug 'vim-airline/vim-airline' --Status Bar
vim.call('plug#begin')

Plug 'norcalli/nvim-colorizer.lua' -- Colorizer
Plug 'preservim/nerdtree' --NerdTree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' -- NerdTree Coloring
Plug 'kyazdani42/nvim-web-devicons' -- icons for NERDTree
Plug 'ryanoasis/vim-devicons' --Developer Icons
Plug 'akinsho/toggleterm.nvim' -- Terminal Toggler
Plug 'preservim/tagbar' --Tagbar for code
Plug 'tpope/vim-surround' --Surrounding ysw)
Plug('navarasu/onedark.nvim', {on = 'Onedark', ['for'] = 'onedark'}) --Atom Dark Colorscheme
Plug 'windwp/nvim-autopairs' --Auto-Pair completion
Plug 'lukas-reineke/indent-blankline.nvim' -- Indentation Lines
Plug 'numToStr/Comment.nvim' -- Commenter
Plug 'nvim-lualine/lualine.nvim' -- Statusline
Plug 'goolord/alpha-nvim' -- Greeter
Plug 'lewis6991/impatient.nvim' -- Cacher for performance
Plug 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
Plug 'williamboman/nvim-lsp-installer' -- LSP Easy Installer
Plug 'RRethy/vim-illuminate' -- Text Highlighter
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim' -- fzf
Plug 'nvim-treesitter/nvim-treesitter' -- Treesitter
Plug 'nvim-treesitter/playground' -- Treesitter playground
Plug 'folke/which-key.nvim' --WhichKey popup suggestions
Plug 'p00f/nvim-ts-rainbow' -- Rainbow Brackets
Plug 'Vimjas/vim-python-pep8-indent' -- Python proper indentation
Plug 'mg979/vim-visual-multi' -- multiple cursors


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

require('onedark').setup {
	style = 'darker',
	highlights = {
		TSFunction = {fg = '#4fa6ed', bg = '#053963', fmt = 'underline,bold'},
		TSMethod = {fg = '#4fa6ed', bg = '#053963', fmt = 'underline,bold'},
		TSFunctionCall = {fg = '#4fa6ed'},
		TSMethodCall = {fg = '#4fa6ed'},
		TSConstructor = {fg = '#db9f44', bg = '#5c431e'},
		Structure = {fg = '#e55561', bg = '#571e23'},
        TSBoolean = {fg = '#bf68d9'},
        TSParameter = {fg = '#cc9057'},
        TSNamespace = {fg = '#ffffff'},
        TSType = {fg = '#15d415', bg = '#084d08', fmt = "underline,bold"}, -- Class Declaration
        -- TSType = {fg = '#db9f44', bg = '#5c431d', fmt = "underline,bold"}, -- Class Declaration
        TSTypeBuiltin = {fg = "#3b41db"},
		TSTodo = {fg = '#000000', bg='#ffff00'},
        TSNumber = {fg = '#0be3e3'},
        TSFloat = {fg = '#0be3e3'},
        TSOperator = {fg = '#bf68d9'},
        TSConstant = {fg = '#a0a8b7'}, -- Global Variables
        WhichKeyFloat = { bg = "cfg.transparent"},
	}
}
require('onedark').load()

require('toggleterm').setup {}
require('colorizer').setup()
require('nvim-autopairs').setup {}
require('Comment').setup {}
require('alpha').setup(require('alpha.themes.dashboard').config)
require('impatient')
require("nvim-lsp-installer").setup {}
require("which-key").setup {}

require("nvim-treesitter.configs").setup {
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        -- custom_captures = {
        --     ["class_name"] = "Error"
        -- }
    },
    rainbow = {
        enable = true,
        extended_mode = true,
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
require("nvim-treesitter.highlight").set_custom_captures {
    ["class_name"] = "TSType",
    ["class_child_ref"] = 'Structure',
    ["type_hinting"] = 'Constant',
    ["self_attribute"] = 'TSLabel',
    ["decorator"] = 'TSOperator',
    ["type"] = "Typedef"
}

require('lualine').setup {
	options = { theme = 'onedark' }
}

require("illuminate").configure({
	providers = {
		'lsp',
		'regex'
	},
	delay = 100,
	under_cursor = true
})

require('cmp').setup {
    sources = {
        { name = 'nvim_lsp+signature_help' }
    }
}

require('telescope').setup{}

-- ToggleTerm Keymaps
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jj', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end
-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')


-- Completion Setup
local cmp = require'cmp'

cmp.setup({
    -- completion = {
        -- completeopt = 'menuone,noinsert,noselect',
        -- autocomplete = true
    -- },
snippet = {
  -- REQUIRED - you must specify a snippet engine
  expand = function(args)
	vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
	-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
	-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
	-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
  end,
},
window = {
  -- completion = cmp.config.window.bordered(),
  -- documentation = cmp.config.window.bordered(),
},
mapping = cmp.mapping.preset.insert({
  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-e>'] = cmp.mapping.abort(),
  ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  ["<Tab>"] = function(fallback)
      if cmp.visible() then
          cmp.select_next_item()

      else
          fallback()
      end
  end,
  ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
          cmp.select_prev_item()

      else
          fallback()
      end
  end
}),
sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
})
-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
})


-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<space><C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f',function() vim.lsp.buf.format { async = true } end, bufopts)
end


-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local nvim_lsp = require('lspconfig')

-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
nvim_lsp['bashls'].setup {
    on_attach = on_attach,
    capabilities = capabilities
}
nvim_lsp['clangd'].setup {
    on_attach = on_attach,
    capabilities = capabilities
}
nvim_lsp['cssls'].setup {
    on_attach = on_attach,
    capabilities = capabilities
}
nvim_lsp['html'].setup {
    on_attach = on_attach,
    capabilities = capabilities
}
-- Python LSP's
nvim_lsp['pyright'].setup {
    on_attach = on_attach,
    capabilities = capabilities
}

-- nvim_lsp['pylsp'].setup {
--   capabilities = capabilities
-- }
-- nvim_lsp['sourcery'].setup {
--   capabilities = capabilities
-- }
-- nvim_lsp['jedi_language_server'].setup {
--     on_attach = on_attach,
--     capabilities = capabilities
-- }

nvim_lsp['quick_lint_js'].setup {
    on_attach = on_attach,
    capabilities = capabilities
}
nvim_lsp['sumneko_lua'].setup {
    on_attach = on_attach,
    capabilities = capabilities
}
nvim_lsp['vimls'].setup {
    on_attach = on_attach,
    capabilities = capabilities
}



-- disabling certain hint-level diagnostics
function filter(arr, func)
	-- Filter in place
	-- https://stackoverflow.com/questions/49709998/how-to-filter-a-lua-array-inplace
	local new_index = 1
	local size_orig = #arr
	for old_index, v in ipairs(arr) do
		if func(v, old_index) then
			arr[new_index] = v
			new_index = new_index + 1
		end
	end
	for i = new_index, size_orig do arr[i] = nil end
end


function filter_diagnostics(diagnostic)
	-- Only filter out Pyright stuff for now
	if diagnostic.source ~= "Pyright" then
		return true
	end

	-- Allow kwargs to be unused, sometimes you want many functions to take the
	-- same arguments but you don't use all the arguments in all the functions,
	-- so kwargs is used to suck up all the extras
	if diagnostic.message == '"kwargs" is not accessed' then
		return false
	end

	-- Allow variables starting with an underscore
	if string.match(diagnostic.message, '"_.+" is not accessed') then
		return false
	end

	return true
end

function custom_on_publish_diagnostics(a, params, client_id, c, config)
	filter(params.diagnostics, filter_diagnostics)
	vim.lsp.diagnostic.on_publish_diagnostics(a, params, client_id, c, config)
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	custom_on_publish_diagnostics, {})
