return {
	{
		"williamboman/mason.nvim",
		opts = {
			ui = {
				border = "single",
			},
		},
		config = function(_, opts)
			require("mason").setup(opts)
			require("mason-lspconfig").setup()
			local mr = require("mason-registry")

			local requirements = {
				-- LSPs
				"bash-language-server",
				"clangd",
				"css-lsp",
				"debugpy",
				"html-lsp",
				"jdtls",
				-- "lua-language-server",
				-- "csharp-language-server",
				-- "omnisharp-mono",
				"pyright",
				"quick-lint-js",
				"rust-analyzer",
				"sqlls",
				-- "sqls",
				"vim-language-server",
				-- Linters
				"jsonlint",
				-- "luacheck",
				"quick-lint-js",
				"ruff",
				"sqlfluff",
				-- Formatters
				"black",
				"isort",
				"jq",
				-- "rustfmt" DEPRECATED,
				"beautysh",
				"sql-formatter",
				"stylua",
				"clang-format",
			}
			for _, r in pairs(requirements) do
				if not mr.is_installed(r) then
					vim.cmd(":MasonInstall " .. r)
				end
			end
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = true,
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"folke/neodev.nvim",
		},
		config = function()
			require("neodev").setup({})
			require("mason").setup()
			require("mason-lspconfig").setup()
			local function filter(arr, func)
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
				for i = new_index, size_orig do
					arr[i] = nil
				end
			end

			local function filter_diagnostics(diagnostic)
				-- Only filter out sqlls stuff for now
				if diagnostic.source ~= "sql" then
					return true
				end

				if diagnostic.message:match('Expected "\\-\\-') then
					return false
				end

				return true
			end

			local function custom_on_publish_diagnostics(a, params, client_id, c, config)
				filter(params.diagnostics, filter_diagnostics)
				vim.lsp.diagnostic.on_publish_diagnostics(a, params, client_id, c, config)
			end
			local default_handler = {
				["textDocument/publishDiagnostics"] = vim.lsp.with(custom_on_publish_diagnostics, {
					virtual_text = false,
					signs = true,
					update_in_insert = false,
				}),
			}
			local lsp = require("lspconfig")
			lsp.bashls.setup({})
			lsp.clangd.setup({})
			lsp.jdtls.setup({ cmd = { vim.fn.stdpath("data") .. "/mason/bin/jdtls" } })
			lsp.html.setup({ handlers = default_handler })
			lsp.pylsp.setup({ handlers = default_handler })
			lsp.sqlls.setup({
				single_file_support = true,
				handlers = default_handler,
			})
			lsp.vimls.setup({})
			lsp.lua_ls.setup({
				handlers = default_handler,
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			})
			-- local function on_attach()
			--     kclient.server_capabilities.semanticTokensProvider = {
			--         full = vim.empty_dict(),
			--         legend = {
			--             tokenModifiers = { "static_symbol" },
			--             tokenTypes = {
			--                 "comment",
			--                 "excluded_code",
			--                 "identifier",
			--                 "keyword",
			--                 "keyword_control",
			--                 "number",
			--                 "operator",
			--                 "operator_overloaded",
			--                 "preprocessor_keyword",
			--                 "string",
			--                 "whitespace",
			--                 "text",
			--                 "static_symbol",
			--                 "preprocessor_text",
			--                 "punctuation",
			--                 "string_verbatim",
			--                 "string_escape_character",
			--                 "class_name",
			--                 "delegate_name",
			--                 "enum_name",
			--                 "interface_name",
			--                 "module_name",
			--                 "struct_name",
			--                 "type_parameter_name",
			--                 "field_name",
			--                 "enum_member_name",
			--                 "constant_name",
			--                 "local_name",
			--                 "parameter_name",
			--                 "method_name",
			--                 "extension_method_name",
			--                 "property_name",
			--                 "event_name",
			--                 "namespace_name",
			--                 "label_name",
			--                 "xml_doc_comment_attribute_name",
			--                 "xml_doc_comment_attribute_quotes",
			--                 "xml_doc_comment_attribute_value",
			--                 "xml_doc_comment_cdata_section",
			--                 "xml_doc_comment_comment",
			--                 "xml_doc_comment_delimiter",
			--                 "xml_doc_comment_entity_reference",
			--                 "xml_doc_comment_name",
			--                 "xml_doc_comment_processing_instruction",
			--                 "xml_doc_comment_text",
			--                 "xml_literal_attribute_name",
			--                 "xml_literal_attribute_quotes",
			--                 "xml_literal_attribute_value",
			--                 "xml_literal_cdata_section",
			--                 "xml_literal_comment",
			--                 "xml_literal_delimiter",
			--                 "xml_literal_embedded_expression",
			--                 "xml_literal_entity_reference",
			--                 "xml_literal_name",
			--                 "xml_literal_processing_instruction",
			--                 "xml_literal_text",
			--                 "regex_comment",
			--                 "regex_character_class",
			--                 "regex_anchor",
			--                 "regex_quantifier",
			--                 "regex_grouping",
			--                 "regex_alternation",
			--                 "regex_text",
			--                 "regex_self_escaped_character",
			--                 "regex_other_escape",
			--             },
			--         },
			--         range = true,
			--     }
			-- end
			-- lsp.csharp_ls.setup({})
			-- lsp.omnisharp.setup {
			--     on_attach = on_attach
			-- }
			-- lsp.omnisharp_mono.setup {
			--     on_attach = on_attach
			-- }
		end,
	},
	{
		"nvimdev/lspsaga.nvim",
		lazy = true,
		event = "VeryLazy",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			ui = {
				title = false,
				border = "rounded",
			},
			lightbulb = {
				enable = false,
			},
			diagnostic = {
				on_insert = false,
			},
		},
		config = function(_, opts)
			require("lspsaga").setup(opts)
			local k = vim.api.nvim_set_keymap
			k("n", "gh", "<cmd>Lspsaga finder<CR>", {})

			k("n", "gr", "<cmd>Lspsaga rename<CR>", {})
			k("n", "gR", "<cmd>Lspsaga rename ++project<CR>", {})

			k("n", "gd", "<cmd>Lspsaga peek_definition<CR>", {})
			k("n", "gD", "<cmd>Lspsaga goto_definition<CR>", {})

			k("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>", {})
			k("n", "gT", "<cmd>Lspsaga goto_type_definition<CR>", {})

			k("n", "<space>v", "<cmd>Lspsaga show_line_diagnostics<CR>", {})
			k("n", "<space>e", "<cmd>Lspsaga show_cursor_diagnostics<CR>", {})
			k("n", "<space>b", "<cmd>Lspsaga show_buf_diagnostics<CR>", {})

			local vd = vim.diagnostic.severity.ERROR
			k("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", {})
			k("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", {})
			vim.keymap.set("n", "[E", function()
				require("lspsaga.diagnostic"):goto_prev({ vd })
			end)
			vim.keymap.set("n", "]E", function()
				require("lspsaga.diagnostic"):goto_next({ vd })
			end)

			k("n", "<leader>o", "<cmd>Lspsaga outline<CR>", {})
			k("n", "K", "<cmd>Lspsaga hover_doc<CR>", {})
			k("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>", {})
			k("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>", {})
			k("n", "<A-t>", "<cmd>Lspsaga term_toggle<CR>", {})
			k("t", "<A-t>", "<cmd>Lspsaga term_toggle<CR>", {})
		end,
	},
	{
		"simrat39/rust-tools.nvim",
		lazy = true,
		ft = "rust",
		opts = function()
			local rt = require("rust-tools")
			local function on_attach(client, buffer)
				vim.keymap.set("n", "<S-k>", rt.hover_actions.hover_actions, { buffer = buffer })
				vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = buffer })
				vim.api.nvim_create_augroup()
			end
			return {
				tools = {
					runnables = {
						use_telescope = true,
					},
					inlay_hints = {
						auto = true,
						show_parameter_hints = false,
						parameter_hints_prefix = "",
						other_hints_prefix = "",
					},
					hover_actions = {

						-- the border that is used for the hover window
						-- see vim.api.nvim_open_win()
						border = {
							{ "╭", "FloatBorder" },
							{ "─", "FloatBorder" },
							{ "╮", "FloatBorder" },
							{ "│", "FloatBorder" },
							{ "╯", "FloatBorder" },
							{ "─", "FloatBorder" },
							{ "╰", "FloatBorder" },
							{ "│", "FloatBorder" },
						},
					},
				},
				server = {
					on_attach = on_attach,
					settings = {
						["rust-analyzer"] = {
							checkOnSave = {
								command = "clippy",
							},
						},
					},
				},
			}
		end,
		config = function(_, opts)
			require("rust-tools").setup(opts)
		end,
	},
}
