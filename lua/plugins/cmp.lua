return {
	{
		"saghen/blink.cmp",
		enabled = true,
		lazy = true,
		event = { "InsertEnter" },
		dependencies = "rafamadriz/friendly-snippets",
		version = "v0.*",
		opts = {
			highlights = {
				use_nvim_cmp_as_default = true,
			},
			nerd_font_variant = "normal",
			keymap = {
				show = "<C-space>",
				hide = "<C-e>",
				accept = "<Tab>",
				scroll_documentation_up = "<C-u>",
				scroll_documentation_down = "<C-d>",
				show_documentation = "K",
				hide_documentation = "K",
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 100,
				update_delay_ms = 10,
			},
			windows = {
				autocomplete = {
					border = "padded",
				},
				documentation = {
					border = "padded",
				},
				signature_help = {
					border = "padded",
				},
			},
		},
	},

	{
		"hrsh7th/nvim-cmp",
		enabled = false,
		lazy = true,
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"onsails/lspkind.nvim",
			"mtoohey31/cmp-fish",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
			-- "nanotee/sqls.nvim"
		},
		opts = function()
			local lspkind = require("lspkind")
			local luasnip = require("luasnip")
			local cmp = require("cmp")
			return {
				sources = {
					{ name = "nvim_lsp" },
					{ name = "nvim_lsp+document_symbol", ft = { "lua" } },
					{ name = "nvim_lsp+signature_help", ft = { "lua" } },
					{ name = "friendly-snippets" },
					{ name = "luasnip", keyword_length = 1 },
					{ name = "nvim_lua", ft = "lua" },
					{ name = "buffer" },
					{ name = "look", ft = { "markup", "html" } },
					{ name = "fish", ft = { "fish" } },
					{ name = "path" },
					-- { name = "sql", ft={"sql", "pgsql"}},
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				-- window = {
				--     completion = cmp.config.window.bordered({
				--         winhighlight = "Normal:FloatBorder,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None"
				--     }),
				--     documentation = cmp.config.window.bordered({
				--         winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
				--     }),
				-- },
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol_text",
						maxwidth = 50,
						ellipsis_char = "...",
						before = function(entry, vim_item)
							return vim_item
						end,
					}),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							if luasnip.expandable() then
								luasnip.expand()
							else
								cmp.confirm({
									select = true,
								})
							end
						else
							fallback()
						end
					end),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.locally_jumpable(1) then
							luasnip.jump(1)
						else
							fallback()
						end
					end, { "i", "s" }),
					["Up"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.locally_jumpable(1) then
							luasnip.jump(1)
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
					["Down"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
			}
		end,
		config = function(_, opts)
			local cmp = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load(opts)
			cmp.setup(opts)
			cmp.setup.filetype("TelescopePrompt", {
				enable = true,
			})
			cmp.setup.cmdline("/", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({ { name = "path" } }, {
					{
						name = "cmdline",
						option = {
							ignore_cmds = { "Man", "!" },
						},
					},
				}),
			})
		end,
	},
}
