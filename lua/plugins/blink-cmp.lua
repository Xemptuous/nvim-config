return {
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
}
