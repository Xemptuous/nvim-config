local languages = {
    "bashls",
    "clangd",
    "cssls",
    "html",
    "jdtls",
    "gopls",
    "lua_ls",
    "basedpyright",
    "quick_lint_js",
    "rust_analyzer",
    "jqls",
    "phpactor",
    "jsonls",
    "ts_ls",
    "zls",
}
-- formatters, linters, debuggers
local additionals = {
    "debugpy",
    "pretty-php",
    "vim-language-server",
    "jsonlint",
    "black",
    "isort",
    "jq",
    "beautysh",
    "sql-formatter",
    "stylua",
}

local default_capabilities = {
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

local on_attach = function(client, bufnr) vim.lsp.inlay_hint.enable(true, { bufnr = bufnr }) end

return {
    {
        "neovim/nvim-lspconfig",
        enabled = false,
        -- event = { "VeryLazy", "BufNewFile" },
        -- dependencies = {
        --           "williamboman/mason.nvim",
        --           "williamboman/mason-lspconfig.nvim",
        -- },
        init = function()
            -- expand gutter to avoid resize
            vim.opt.signcolumn = "yes"
            -- local border = { " ", "", "", "", "", "", " ", " " }

            local border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" }
            vim.diagnostic.config({
                virtual_text = false,
                underline = false,
                signs = true,
                update_in_insert = false,
                severity_sort = true,
                float = {
                    border = border,
                    source = "always",
                    header = "",
                    prefix = "",
                },
            })

            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
            vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })
            vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
                virtual_text = false,
                underline = true,
                signs = true,
                update_in_insert = false,
            })

            local signs = {
                Error = "󰅚 ",
                Warn = "󰀪 ",
                Hint = "󰌶 ",
                Info = " ",
            }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end
        end,
        config = function()
            vim.api.nvim_create_autocmd("LspAttach", {
                desc = "LSP actions",
                callback = function(event)
                    local opts = { buffer = event.buf }
                    local k = vim.keymap.set
                    k("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
                    k("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "Goto Definition", buffer = event.buf })
                    k("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", { desc = "Goto Declaration", buffer = event.buf })
                    k("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", { desc = "Goto Implementation", buffer = event.buf })
                    k("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", { desc = "Goto Type Definition", buffer = event.buf })
                    k("n", "gR", "<cmd>lua vim.lsp.buf.references()<cr>", { desc = "Goto References", buffer = event.buf })
                    k("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
                    k("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "LSP Rename", buffer = event.buf })
                    k("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
                    k("x", "<F4>", "<cmd>lua vim.lsp.buf.range_code_action()<cr>", opts)
                    k(
                        "n",
                        "<leader>v",
                        "<cmd>lua vim.diagnostic.open_float()<cr>",
                        { desc = "Current Line Diagnostics", buffer = event.buf }
                    )
                    k("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { desc = "Next Diagnostic", buffer = event.buf })
                    k("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "Prev Diagnostic", buffer = event.buf })
                    k("n", "<leader>B", "<cmd>lua vim.diagnostic.setloclist()<cr>", { desc = "LSP LOC List", buffer = event.buf })
                    k("n", "<leader>W", "<cmd>lua vim.diagnostic.setqflist()<cr>", { desc = "LSP QF List", buffer = event.buf })
                end,
            })
            local lsp = require("lspconfig")

            local capabilities = lsp.util.default_config
            capabilities.capabilities = vim.tbl_deep_extend("force", capabilities.capabilities, default_capabilities)

            -- require("mason").setup()
            -- require("mason-lspconfig").setup({ ensure_installed = languages })
            -- local mr = require("mason-registry")
            -- for _, r in pairs(additionals) do
            -- 	if not mr.is_installed(r) then
            -- 		vim.cmd(":MasonInstall " .. r)
            -- 	end
            -- end
            for _, lang in pairs(languages) do
                local opts = {
                    capabilities = capabilities,
                    on_attach = on_attach,
                }
                if lang == "lua_ls" then
                    opts.settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                            },
                        },
                    }
                elseif lang == "basedpyright" then
                    opts.settings = {
                        basedpyright = {
                            analysis = {
                                autoImportCompletions = true,
                                typeCheckingMode = "off", -- off, basic, standard, strict, recommended, all
                            },
                        },
                    }
                elseif lang == "rust_analyzer" then
                    opts.settings = {
                        ["rust-analyzer"] = {
                            diagnostics = {
                                disabled = { "unlinked-file" },
                            },
                            cargo = {
                                allFeatures = true,
                            },
                            checkOnSave = {
                                command = "clippy",
                            },
                        },
                    }
                elseif lang == "clang" then
                    opts.filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto", "cs", "java" }
                end
                lsp[lang].setup(opts)
            end

            -- vim.api.nvim_create_autocmd("BufWritePre", {
            --     callback = function ()
            --         vim.lsp.buf.format { async = false }
            --     end
            -- })

            -- -- show diagnostics on cursor hover

            -- -- set swapfile update for auto hover diagnostics
            -- vim.o.updatetime = 250

            -- vim.api.nvim_create_autocmd({ "CursorHold" }, {
            -- 	pattern = "*",
            -- 	callback = function()
            -- 		for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
            -- 			if vim.api.nvim_win_get_config(winid).zindex then
            -- 				return
            -- 			end
            -- 		end
            -- 		vim.diagnostic.open_float({
            -- 			scope = "cursor",
            -- 			focusable = false,
            -- 			close_events = {
            -- 				"CursorMoved",
            -- 				"CursorMovedI",
            -- 				"BufHidden",
            -- 				"InsertCharPre",
            -- 				"WinLeave",
            -- 			},
            -- 		})
            -- 	end,
            -- })
        end,
    },
    {
        "mrcjkb/rustaceanvim",
        enabled = false,
        dependencies = "neovim/nvim-lspconfig",
        version = "^5",
        ft = { "rust" },
        config = function()
            local lsp = require("lspconfig")
            local capabilities = lsp.util.default_config
            capabilities.capabilities = vim.tbl_deep_extend("force", capabilities.capabilities, default_capabilities)

            vim.g.rustaceanvim = {
                on_attach = on_attach,
                capabilities = capabilities,
                tools = {
                    on_initialized = function() return false end,
                },
                server = {
                    show_notify_level = false,
                    status_notify_level = false,
                    -- on_attach = on_attach,
                    -- capabilities = capabilities,
                    default_settings = {
                        ["rust_analyzer"] = {
                            cargo = {
                                allFeatures = true,
                            },
                            checkOnSave = {
                                command = "clippy",
                            },
                        },
                    },
                },
            }
        end,
    },
    {
        "stevearc/aerial.nvim",
        keys = { "<leader>a" },
        config = function()
            require("aerial").setup({
                -- optionally use on_attach to set keymaps when aerial has attached to a buffer
                on_attach = function(bufnr)
                    -- Jump forwards/backwards with '{' and '}'
                    vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
                    vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
                end,
                autojump = true,
            })
            -- You probably also want to set a keymap to toggle aerial
            vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
            -- vim.keymap.set("n", "<leader>A", "<cmd>AerialNavToggle<CR>")
        end,
    },
    {
        "nvimdev/lspsaga.nvim",
        enabled = false,
        event = "VeryLazy",
        dependencies = {
            -- "echasnovski/mini.icons",
            -- "nvim-tree/nvim-web-devicons",
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

            k("n", "<leader>v", "<cmd>Lspsaga show_line_diagnostics<CR>", {})
            k("n", "<leader>e", "<cmd>Lspsaga show_cursor_diagnostics<CR>", {})
            k("n", "<leader>b", "<cmd>Lspsaga show_buf_diagnostics<CR>", {})

            local vd = vim.diagnostic.severity.ERROR
            k("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", {})
            k("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", {})
            vim.keymap.set("n", "[E", function() require("lspsaga.diagnostic"):goto_prev({ vd }) end)
            vim.keymap.set("n", "]E", function() require("lspsaga.diagnostic"):goto_next({ vd }) end)

            k("n", "<leader>o", "<cmd>Lspsaga outline<CR>", {})
            k("n", "<leader>k", "<cmd>Lspsaga hover_doc<CR>", {})
            k("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>", {})
            k("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>", {})
            k("n", "<A-t>", "<cmd>Lspsaga term_toggle<CR>", {})
            k("t", "<A-t>", "<cmd>Lspsaga term_toggle<CR>", {})
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
    {
        "williamboman/mason.nvim",
        enabled = false,
        event = { "CmdlineEnter" },
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
        },

        config = function()
            -- local lsp = require("lspconfig")
            local mr = require("mason-registry")
            for _, r in pairs(additionals) do
                if not mr.is_installed(r) then vim.cmd(":MasonInstall " .. r) end
            end
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = languages,
            })
            --     handlers = {
            --         function(server_name)
            --             lsp[server_name].setup({
            --                 capabilities = capabilities,
            --                 on_attach = on_attach,
            --             })
            --         end,
            --         lua_ls = function()
            --             lsp.lua_ls.setup({
            --                 capabilities = capabilities,
            --                 on_attach = on_attach,
            --                 settings = {
            --                     Lua = {
            --                         diagnostics = {
            --                             globals = { "vim" },
            --                         },
            --                     },
            --                 },
            --             })
            --         end,
            --         basedpyright = function()
            --             lsp.basedpyright.setup({
            --                 capabilities = capabilities,
            --                 on_attach = on_attach,
            --                 settings = {
            --                     basedpyright = {
            --                         analysis = {
            --                             autoImportCompletions = true,
            --                             typeCheckingMode = "off", -- off, basic, standard, strict, recommended, all
            --                         },
            --                     },
            --                 },
            --             })
            --         end,
            --         clangd = function()
            --             lsp.clangd.setup({
            --                 capabilities = capabilities,
            --                 on_attach = on_attach,
            --                 filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto", "cs", "java" },
            --             })
            --         end,
            --         rust_analyzer = function()
            --             lsp.rust_analyzer.setup({
            --                 capabilities = capabilities,
            --                 on_attach = on_attach,
            --                 settings = {
            --                     ["rust_analyzer"] = {
            --                         cargo = {
            --                             allFeatures = true,
            --                         },
            --                         checkOnSave = {
            --                             command = "clippy",
            --                         },
            --                     },
            --                 },
            --             })
            --         end,
            --         -- csharp_ls = function()
            --         -- 	lsp.csharp_ls.setup({
            --         -- 		root_dir = function(startpath)
            --         -- 			return lsp.util.root_pattern("*.sln")(startpath)
            --         -- 				or lsp.util.root_pattern("*.csproj")(startpath)
            --         -- 				or lsp.util.root_pattern("*.fsproj")(startpath)
            --         -- 				or lsp.util.root_pattern(".git")(startpath)
            --         -- 		end,
            --         -- 		on_attach = on_attach,
            --         -- 		capabilities = capabilities,
            --         -- 	})
            --         -- end,
            --         -- lsp.sqls.setup({})
            --         -- lsp.vimls.setup({ capabilities = capabilities })
            --         -- lua_ls = function()
            --         -- 	lsp.lua_ls.setup({
            --         -- 		capabilities = capabilities,
            --         -- 		-- handlers = default_handler,
            --         -- 		settings = {
            --         -- 			Lua = {
            --         -- 				completion = {
            --         -- 					callSnippet = "Replace",
            --         -- 				},
            --         -- 			},
            --         -- 		},
            --         -- 	})
            --         -- end,
            --     },
            -- })
        end,
    },
}
