return {
    {
        "saghen/blink.cmp",
        enabled = false,
        event = { "InsertEnter" },
        dependencies = "rafamadriz/friendly-snippets",
        version = "v0.*",
        opts = {
            keymap = { preset = "super-tab" },
            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = "mono",
            },
            sources = {
                completion = {
                    enabled_providers = {
                        "lsp",
                        "path",
                        "snippets",
                        "buffer",
                    },
                },
            },
            snippets = {
                -- Function to use when expanding LSP provided snippets
                expand = function(snippet) vim.snippet.expand(snippet) end,
                -- Function to use when checking if a snippet is active
                active = function(filter) return vim.snippet.active(filter) end,
                -- Function to use when jumping between tab stops in a snippet, where direction can be negative or positive
                jump = function(direction) vim.snippet.jump(direction) end,
            },
            completion = {
                keyword = { range = "full" },
                trigger = {
                    show_in_snippet = false,
                },
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 20,
                update_delay_ms = 10,
            },
            fuzzy = {
                use_typo_resistance = false,
            },
            opts_extend = { "sources.completion.enabled_providers" },
        },
    },

    {
        "hrsh7th/nvim-cmp",
        enabled = true,
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "windwp/nvim-autopairs",
            "onsails/lspkind.nvim",
            "rafamadriz/friendly-snippets",
            { "mtoohey31/cmp-fish", ft = { "fish" } },
            {
                "garymjr/nvim-snippets",
                -- event = { "InsertEnter", "CmdlineEnter" },
                keys = {
                    {
                        "<Tab>",
                        function()
                            if vim.snippet.active({ direction = 1 }) then
                                vim.schedule(function() vim.snippet.jump(1) end)
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
                            vim.schedule(function() vim.snippet.jump(1) end)
                        end,
                        expr = true,
                        silent = true,
                        mode = "s",
                    },
                    {
                        "<S-Tab>",
                        function()
                            if vim.snippet.active({ direction = -1 }) then
                                vim.schedule(function() vim.snippet.jump(-1) end)
                                return
                            end
                            return "<S-Tab>"
                        end,
                        expr = true,
                        silent = true,
                        mode = { "i", "s" },
                    },
                },
                opts = {
                    friendly_snippets = true,
                },
            },
            -- { "sqlua.nvim", ft = { "sql", "mysql", "psql" }},
            -- { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "psql" }},
        },
        opts = {
            sources = {
                { name = "nvim_lsp" },
                { name = "nvim_lsp+document_symbol" },
                { name = "nvim_lsp+signature_help" },
                { name = "snippets" },
                { name = "friendly-snippets" },
                { name = "nvim_lua" },
                { name = "buffer" },
                { name = "look", ft = { "markup", "html" } },
                { name = "fish", ft = { "fish" } },
                { name = "path" },
                -- { name = "vim-dadbod-completion", ft = { "sql", "mysql", "psql" } },
                -- { name = "sqlua", ft = { "sql", "mysql", "psql" } },
            },
            completion = { completeopt = "noselect" },
            performance = {
                debounce = 0,
                throttle = 0,
                async_budget = 20,
            },
            snippet = { expand = function(args) vim.snippet.expand(args.body) end },
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
        },
        config = function(_, opts)
            vim.opt.completeopt = { "menuone", "noselect", "noinsert" }
            vim.opt.shortmess = vim.opt.shortmess + { c = true }
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            local cmp = require("cmp")
            -- require("luasnip.loaders.from_vscode").lazy_load(opts)

            opts["preselect"] = cmp.PreselectMode.None
            opts["mapping"] = cmp.mapping.preset.insert({
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
            })
            cmp.setup(opts)
            cmp.setup.filetype("TelescopePrompt", { enable = true })
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
}
