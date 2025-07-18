return {
    {
        "saghen/blink.cmp",
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = {
            "rafamadriz/friendly-snippets",
            -- "milanglacier/minuet-ai.nvim",
            "MeanderingProgrammer/render-markdown.nvim",
            "onsails/lspkind.nvim",
            -- "Kaiser-Yang/blink-cmp-avante",
            { "xzbdmw/colorful-menu.nvim", opts = {} },
        },
        version = "1.*",
        -- build = "cargo build --release",

        opts_extend = { "sources.default" },
        opts = function()
            -- local b = require("blink.cmp").add_source_provider("minuet", { name = "minuet", module = "minuet.blink" })
            return {
                keymap = {
                    preset = "super-tab",
                    ["<Tab>"] = {
                        function(cmp)
                            if cmp.snippet_active() or cmp.is_visible() then
                                return cmp.accept()
                            else
                                return cmp.select_and_accept()
                            end
                        end,
                        "snippet_forward",
                        "fallback",
                    },
                    -- ["<C-y>"] = {
                    --     function(cmp) cmp.show({ providers = { "minuet" } }) end,
                    -- },
                    -- ["<CR>"] = { "accept", "fallback" },
                },
                sources = {
                    providers = {
                        -- avante = {
                        --     module = "blink-cmp-avante",
                        --     name = "Avante",
                        --     opts = {},
                        -- },
                        -- minuet = {
                        --     name = "minuet",
                        --     module = "minuet.blink",
                        --     async = true,
                        --     -- Should match minuet.config.request_timeout * 1000,
                        --     -- since minuet.config.request_timeout is in seconds
                        --     timeout_ms = 3000,
                        --     score_offset = 50, -- Gives minuet higher priority among suggestions
                        -- },
                    },
                    -- default = { "avante", "lsp", "path", "snippets", "buffer", "minuet", "cmdline" },
                    -- default = { "lsp", "path", "snippets", "buffer", "minuet", "cmdline" },
                },
                sources = { default = { "lsp", "path", "snippets", "buffer", "cmdline" } },
                signature = {
                    enabled = true,
                    trigger = {
                        show_on_insert = true,
                    },
                    window = {
                        border = "single",
                        winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
                    },
                },
                cmdline = {
                    enabled = true,
                    keymap = {
                        preset = "inherit",
                    },
                    completion = {
                        menu = {
                            auto_show = true,
                        },
                    },
                },
                appearance = {
                    use_nvim_cmp_as_default = false,
                    nerd_font_variant = "mono",
                },
                completion = {
                    documentation = {
                        auto_show = true,
                        auto_show_delay_ms = 250,
                        update_delay_ms = 50,
                        window = {
                            border = "single",
                            winblend = 10,
                        },
                    },
                    keyword = { range = "full" },
                    trigger = {
                        show_in_snippet = false,
                        prefetch_on_insert = false,
                    },
                    accept = { auto_brackets = { enabled = false } },
                    menu = {
                        border = "padded",
                        winblend = 0,
                        -- winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
                        winhighlight = "CursorLine:Visual,Search:None",
                        scrolloff = 2,
                        auto_show = true,
                        draw = {
                            -- We don't need label_description now because label and label_description are already
                            -- combined together in label by colorful-menu.nvim.
                            columns = {
                                { "kind_icon" },
                                { "label", gap = 1 },
                                -- { "label", "label_description", "kind", gap = 1 },
                            },
                            components = {
                                kind_icon = {
                                    ellipsis = false,
                                    text = function(ctx)
                                        -- local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                                        return require("lspkind").symbolic(ctx.kind, { mode = "symbol" })
                                    end,
                                },
                                label = {
                                    text = function(ctx) return require("colorful-menu").blink_components_text(ctx) end,
                                    highlight = function(ctx) return require("colorful-menu").blink_components_highlight(ctx) end,
                                },
                            },
                        },
                    },
                },
            }
        end,
        config = function(_, opts) require("blink.cmp").setup(opts) end,
    },

    {
        "hrsh7th/nvim-cmp",
        enabled = false,
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
