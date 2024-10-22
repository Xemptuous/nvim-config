return {
	{
		"williamboman/mason.nvim",
		opts = {
			ui = {
				border = "single",
			},
			log_level = vim.log.levels.DEBUG,
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
				"gopls",
				-- "lua-language-server",
				"csharp-language-server",
				"python-lsp-server",
				"quick-lint-js",
				"rust-analyzer",
				-- "phpactor",
				"pretty-php",
				-- "sqls",
				"vim-language-server",
				-- Linters
				"jsonlint",
				-- "luacheck",
				"typescript-language-server",
				"quick-lint-js",
				"ruff",
				-- "sqlfluff",
				-- Formatters
				"black",
				"isort",
				"jq",
				"zls",
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
			-- "nanotee/sqls.nvim",
		},
		config = function()
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
					underline = false,
					signs = true,
					update_in_insert = false,
				}),
			}
			-- local cmp = require("cmp")
			local capabilities = {
				textDocument = {
					completion = {
						dynamicRegistration = false,
						completionItem = {
							snippetSupport = true,
							commitCharactersSupport = true,
							deprecatedSupport = true,
							preselectSupport = true,
							tagSupport = {
								valueSet = {
									1, -- Deprecated
								},
							},
							insertReplaceSupport = true,
							resolveSupport = {
								properties = {
									"documentation",
									"detail",
									"additionalTextEdits",
									"sortText",
									"filterText",
									"insertText",
									"textEdit",
									"insertTextFormat",
									"insertTextMode",
								},
							},
							insertTextModeSupport = {
								valueSet = {
									1, -- asIs
									2, -- adjustIndentation
								},
							},
							labelDetailsSupport = true,
						},
						contextSupport = true,
						insertTextMode = 1,
						completionList = {
							itemDefaults = {
								"commitCharacters",
								"editRange",
								"insertTextFormat",
								"insertTextMode",
								"data",
							},
						},
					},
				},
			}

			local lsp = require("lspconfig")
			lsp.bashls.setup({ capabilities = capabilities })
			lsp.clangd.setup({ capabilities = capabilities })
			lsp.jdtls.setup({
				capabilities = capabilities,
				cmd = { vim.fn.stdpath("data") .. "/mason/bin/jdtls" },
			})
			lsp.html.setup({
				capabilities = capabilities,
				handlers = default_handler,
			})
			lsp.pylsp.setup({
				capabilities = capabilities,
				handlers = default_handler,
			})
			lsp.zls.setup({ capabilities = capabilities })
			lsp.phpactor.setup({ capabilities = capabilities })
			lsp.gopls.setup({ capabilities = capabilities })
			lsp.rust_analyzer.setup({
				capabilities = capabilities,
				handlers = default_handler,
				on_attach = function(client, bufnr)
					vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
				end,
				settings = {
					["rust_analyzer"] = {
						cargo = {
							allFeatures = true,
						},
						checkOnSave = {
							command = "clippy",
						},
					},
				},
			})
			lsp.ts_ls.setup({ capabilities = capabilities })
			lsp.csharp_ls.setup({
				root_dir = function(startpath)
					return lsp.util.root_pattern("*.sln")(startpath)
						or lsp.util.root_pattern("*.csproj")(startpath)
						or lsp.util.root_pattern("*.fsproj")(startpath)
						or lsp.util.root_pattern(".git")(startpath)
				end,
				on_attach = on_attach,
				capabilities = capabilities,
			})
			-- lsp.sqls.setup({})
			lsp.vimls.setup({ capabilities = capabilities })
			lsp.lua_ls.setup({
				capabilities = capabilities,
				handlers = default_handler,
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			})
		end,
	},
	{
		"https://github.com/mrcjkb/rustaceanvim",
		enabled = false,
		version = "^5",
		lazy = false,
	},
	{
		"nvimdev/lspsaga.nvim",
		enabled = true,
		lazy = true,
		event = "VeryLazy",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			-- "nvim-treesitter/nvim-treesitter",
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
			require("../keymaps/lspsaga")
		end,
	},
	{
		"PedramNavid/dbtpal",
		enabled = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("dbtpal").setup({
				path_to_dbt = "dbt",
				path_to_dbt_project = "",
				path_to_dbt_profiles_dir = vim.fn.expand("~/.dbt"),
				extended_path_search = true,
				protect_compiled_files = true,
				custom_dbt_syntax_enabled = false,
			})
			require("telescope").load_extension("dbtpal")
		end,
	},
	-- { "evanleck/vim-svelte" },
	-- { "lifepillar/pgsql.vim" }
}
