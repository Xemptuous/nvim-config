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
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"mtoohey31/cmp-fish",
			"garymjr/nvim-snippets",
			-- "L3MON4D3/LuaSnip",
			-- "saadparwaiz1/cmp_luasnip",
			-- "rafamadriz/friendly-snippets",
			"windwp/nvim-autopairs",
			-- "nanotee/sqls.nvim"
			"onsails/lspkind.nvim",
		},
		opts = function()
			-- local lspkind = require("lspkind")
			-- local luasnip = require("luasnip")
			local cmp = require("cmp")
			return {
				sources = {
					{ name = "nvim_lsp" },
					{ name = "nvim_lsp+document_symbol", ft = { "lua" } },
					{ name = "nvim_lsp+signature_help", ft = { "lua" } },
					{ name = "friendly-snippets" },
					-- { name = "luasnip", keyword_length = 1 },
					{ name = "nvim_lua", ft = "lua" },
					{ name = "buffer" },
					{ name = "look", ft = { "markup", "html" } },
					{ name = "fish", ft = { "fish" } },
					{ name = "path" },
					-- { name = "sql", ft={"sql", "pgsql"}},
				},
				completion = {
					completeopt = "noselect",
				},
				performance = {
					debounce = 0,
					throttle = 0,
					async_budget = 20,
				},
				-- preselect = cmp.PreselectMode.None,
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
					end,
				},
				-- experimental = { ghost_text = true },
				window = {
					completion = {
						border = "none",
						winhighlight = "Normal:Normal,Search:None,FloatBorder:FloatBorder",
						col_offset = -3,
						side_padding = 0,
						scrollbar = false,
					},
					documentation = {
						border = "single",
						winhighlight = "Normal:Normal,Search:None,FloatBorder:FloatBorder",
						col_offset = -3,
						side_padding = 0,
					},
					-- completion = cmp.config.window.bordered({
					-- 	border = "single",
					-- 	col_offset = -3,
					-- 	side_padding = 0,
					-- }),
					-- documentation = cmp.config.window.bordered({
					-- 	border = "single",
					-- }),
				},
				formatting = {
					fields = { "kind", "abbr" },
					expandable_indicator = true,
					format = function(entry, vim_item)
						local kind = require("lspkind").cmp_format({
							mode = "symbol_text",
							maxwidth = 50,
						})(entry, vim_item)
						local strings = vim.split(kind.kind, "%s", { trimempty = true })
						kind.kind = " " .. (strings[1] or "") .. " "
						kind.menu = "    (" .. (strings[2] or "") .. ")"
						return kind
					end,
					-- format = lspkind.cmp_format({
					-- 	mode = "symbol_text",
					-- 	maxwidth = 50,
					-- 	ellipsis_char = "...",
					-- 	before = function(entry, vim_item)
					-- 		return vim_item
					-- 	end,
					-- }),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.confirm({
								behavior = cmp.ConfirmBehavior.Insert,
								select = true,
							})
						else
							fallback()
						end
					end),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif vim.snippet.active({ direction = 1 }) then
							vim.snippet.jump(1)
						else
							fallback()
						end
					end, { "i", "s" }),
					["Up"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif vim.snippet.active({ direction = 1 }) then
							vim.snippet.jump(1)
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif vim.snippet.active({ direction = -1 }) then
							vim.snippet.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
					["Down"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif vim.snippet.active({ direction = -1 }) then
							vim.snippet.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
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
