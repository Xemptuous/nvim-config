-- Completion Setup
local lspkind = require('lspkind')
require('cmp').setup {
  sources = {
    { name = 'nvim_lsp+signature_help' },
    { name = 'path' },
    { name = 'nvim_lsp', keyword_length = 1 },
    { name = 'luasnip', keyword_length = 2 },
    { name = 'buffer', keyword_length = 3 },
  }
}
local cmp = require('cmp')
cmp.setup({
	snippet = {
			expand = function(args)
      require('luasnip').lsp_expand(args.body)
				-- vim.fn["vsnip#anonymous"](args.body)
			end,
	},
	window = {
		completion = cmp.config.window.bordered({
			winhighlight = "Normal:FloatBorder,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None"
		}),
		documentation = cmp.config.window.bordered(),
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = 'symbol_text',
			maxwidth = 50,
			ellipsis_char = '...',
			before = function(entry, vim_item)
				return vim_item
			end
		})
		-- format = function (entry, vim_item)
		-- 	vim_item.abbr = ' ' .. vim_item.abbr
		-- 	vim_item.menu = (vim_item.menu or '') .. ' '
		-- 	return vim_item
		-- end
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = false }),
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
	sources = cmp.config.sources(
		{
			{ name = 'nvim_lsp' },
			-- { name = 'vsnip' },
      { name = 'luasnip' },
		},
		{
			{ name = 'buffer' },
		}
	),
})

cmp.setup.filetype('TelescopePrompt', {
	enable = false,
})
--
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources(
    {
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    },
    {
      { name = 'buffer' },
    })
})
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
})
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources(
    {
      { name = 'path' }
    },
    {
      {
        name = 'cmdline',
        option = {
          ignore_cmds = { 'Man', '!' }
        }
      }
    })
})
