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
            local mr = require("mason-registry")

            local requirements = {
                -- LSPs
                "bash-language-server",
                "clangd",
                "css-lsp",
                "debugpy",
                "html-lsp",
                "jdtls",
                "lua-language-server",
                "pyright",
                "quick-lint-js",
                "rust-analyzer",
                "sqlls",
                "vim-language-server",
                -- Linters
                "jsonlint",
                "luacheck",
                "quick-lint-js",
                "ruff",
                "sqlfluff",
                -- Formatters
                "black",
                "jq",
                "rustfmt",
                "beautysh",
                "sql-formatter",
                "stylua",
                "clang-format"
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
        dependencies = "williamboman/mason.nvim",
        config = function()
            local lsp = require("lspconfig")
            lsp.bashls.setup({})
            lsp.clangd.setup({})
            lsp.jdtls.setup({ cmd = { vim.fn.stdpath("data") .. "/mason/bin/jdtls" }, })
            lsp.html.setup({})
            lsp.pylsp.setup({})
            lsp.sqlls.setup({})
            lsp.vimls.setup({})
            lsp.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            })

            vim.diagnostic.config({
                virtual_text = false,
                signs = true,
                underline = true,
                severity_sort = true,
                update_in_insert = false,
            })

            vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
                update_in_insert = false,
            })
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
            k("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", {})

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
        end
	},
	{
		"simrat39/rust-tools.nvim",
		lazy = true,
		ft = "rust",
        opts = function()
            local rt = require("rust-tools")
            local function on_attach(client, buffer)
                vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = buffer })
                vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = buffer })
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
        end
	}
}
