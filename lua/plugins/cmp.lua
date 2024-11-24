return {
	{
		"saghen/blink.cmp",
		enabled = false,
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
		enabled = true,
		lazy = true,
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-cmdline",
			{ "hrsh7th/cmp-nvim-lua", ft = { "lua" }, lazy = true },
			"hrsh7th/cmp-nvim-lsp-signature-help",
			{ "mtoohey31/cmp-fish", ft = { "fish" }, lazy = true },
			"garymjr/nvim-snippets",
			-- { "sqlua.nvim", ft = { "sql", "mysql", "psql" }, lazy = true },
			-- { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "psql" }, lazy = true },
			"windwp/nvim-autopairs",
			"onsails/lspkind.nvim",
		},
		opts = function()
			local cmp = require("cmp")
			return {
				sources = {
					{ name = "nvim_lsp" },
					{ name = "nvim_lsp+document_symbol", ft = { "lua" } },
					{ name = "nvim_lsp+signature_help", ft = { "lua" } },
					{ name = "friendly-snippets" },
					{ name = "nvim_lua", ft = "lua" },
					{ name = "buffer" },
					{ name = "look", ft = { "markup", "html" } },
					{ name = "fish", ft = { "fish" } },
					{ name = "path" },
					{ name = "vim-dadbod-completion", ft = { "sql", "mysql", "psql" } },
					-- { name = "sqlua", ft = { "sql", "mysql", "psql" } },
				},
				completion = {
					completeopt = "noselect",
				},
				performance = {
					debounce = 0,
					throttle = 0,
					async_budget = 20,
				},
				preselect = cmp.PreselectMode.None,
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
					end,
				},
				-- experimental = { ghost_text = true },
				window = {
					completion = {
						border = "none",
						winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
						winblend = vim.o.pumblend,
						col_offset = -3,
						side_padding = 0,
						scrollbar = false,
					},
					documentation = {
						border = "single",
						-- winhighlight = "Normal:Normal,Search:None,FloatBorder:FloatBorder",
						col_offset = -3,
						side_padding = 0,
					},
				},
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(entry, vim_item)
						local kind = require("lspkind").cmp_format({
							mode = "symbol_text",
							maxwidth = 50,
							show_labelDetails = true,
						})(entry, vim_item)
						local strings = vim.split(kind.kind, "%s", { trimempty = true })
						kind.kind = " " .. (strings[1] or "") .. " "
						-- kind.menu = "    (" .. (strings[2] or "") .. ")"
						return kind
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.confirm({
								behavior = cmp.ConfirmBehavior.Insert,
								select = true,
							})
						else
							fallback()
						end
					end),
				}),
			}
		end,
		config = function(_, opts)
			vim.opt.completeopt = { "menuone", "noselect", "noinsert" }
			vim.opt.shortmess = vim.opt.shortmess + { c = true }
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			-- require("luasnip.loaders.from_vscode").lazy_load(opts)
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
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
	{
		"garymjr/nvim-snippets",
		keys = {
			{
				"<Tab>",
				function()
					if vim.snippet.active({ direction = 1 }) then
						vim.schedule(function()
							vim.snippet.jump(1)
						end)
						return
					end
					return "<Tab>"
				end,
				expr = true,
				silent = true,
				mode = "i",
			},
			{
				"<Tab>",
				function()
					vim.schedule(function()
						vim.snippet.jump(1)
					end)
				end,
				expr = true,
				silent = true,
				mode = "s",
			},
			{
				"<S-Tab>",
				function()
					if vim.snippet.active({ direction = -1 }) then
						vim.schedule(function()
							vim.snippet.jump(-1)
						end)
						return
					end
					return "<S-Tab>"
				end,
				expr = true,
				silent = true,
				mode = { "i", "s" },
			},
		},
	},
}
