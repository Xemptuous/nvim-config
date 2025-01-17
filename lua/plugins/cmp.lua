return {
    {
        "saghen/blink.cmp",
        enabled = true,
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = {
            "rafamadriz/friendly-snippets",
            -- "echasnovski/mini.icons",
            "onsails/lspkind.nvim",
        },
        -- version = "v0.*",
        build = "cargo build --release",
        opts = {
            sources = { default = { "lsp", "path", "snippets", "buffer" } },
            keymap = { preset = "super-tab" },
            signature = { enabled = false },
            fuzzy = { use_typo_resistance = false },
            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = "mono",
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
                documentation = {
                    auto_show = true,
                    -- auto_show_delay_ms = 250,
                    -- update_delay_ms = 50,
                    window = {
                        border = "single",
                        winblend = 10,
                    },
                },
                keyword = { range = "full" },
                trigger = { show_in_snippet = false },
                -- list = { max_items = 20 },
                accept = { auto_brackets = { enabled = true } },
                menu = {
                    max_height = 20,
                    border = "padded",
                    winblend = 10,
                    auto_show = true,
                    draw = {
                        columns = {
                            { "kind_icon" },
                            { "label", "label_description", "kind", gap = 1 },
                        },
                        components = {
                            kind_icon = {
                                ellipsis = false,
                                text = function(ctx)
                                    -- local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                                    return require("lspkind").symbolic(ctx.kind, { mode = "symbol" })
                                end,
                            },
                        },
                    },
                },
            },
        },
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
