return {
	{
		"williamboman/mason.nvim",
		opts = {
			ui = {
				border = "single",
			},
            log_level = vim.log.levels.DEBUG
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
			"folke/neodev.nvim",
            -- "nanotee/sqls.nvim",
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
                    underline = false,
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
            lsp.zls.setup({})
            lsp.phpactor.setup({})
            lsp.gopls.setup({})
            lsp.rust_analyzer.setup({})
            lsp.tsserver.setup({})
            lsp.csharp_ls.setup({
                root_dir = function(startpath)
                    return lsp.util.root_pattern("*.sln")(startpath)
                        or lsp.util.root_pattern("*.csproj")(startpath)
                        or lsp.util.root_pattern("*.fsproj")(startpath)
                        or lsp.util.root_pattern(".git")(startpath)
                end,
                -- on_attach = on_attach,
                -- capabilities = capabilities,
            })
            -- lsp.sqls.setup({})
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
		end,
	},
	{
		"nvimdev/lspsaga.nvim",
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
        "PedramNavid/dbtpal",
        -- lazy = true,
        -- event = "VeryLazy",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        },
        -- ft = {
        --     "sql",
        --     "dbt",
        --     "md",
        --     "yaml",
        -- },
        config = function()
            require("dbtpal").setup({
                path_to_dbt = "dbt",
                path_to_dbt_project = "",
                path_to_dbt_profiles_dir = vim.fn.expand("~/.dbt"),
                extended_path_search = true,
                protect_compiled_files = true,
                custom_dbt_syntax_enabled = false
            })
            require("telescope").load_extension("dbtpal")
        end,
    },
    { "evanleck/vim-svelte" },
    { "lifepillar/pgsql.vim" }
}
