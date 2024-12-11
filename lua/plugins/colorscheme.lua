return {
    {
        "catppuccin/nvim",
        lazy = false,
        priority = 1000,
        opts = {
            flavour = "mocha",
            dim_inactive = {
                enabled = true,
                shade = "dark",
                percentage = 0.01,
            },
            integrations = {
                cmp = true,
                dadbod_ui = true,
                flash = true,
                gitsigns = true,
                indent_blankline = { enabled = true },
                lsp_saga = true,
                mason = true,
                mini = { enabled = true },
                notify = true,
                nvim_surround = true,
                nvimtree = true,
                render_markdown = true,
                markdown = true,
                native_lsp = {
                    enabled = true,
                    virtual_text = {
                        errors = { "italic" },
                        hints = { "italic" },
                        warnings = { "italic" },
                        information = { "italic" },
                    },
                    underlines = {
                        errors = { "undercurl" },
                        hints = { "undercurl" },
                        warnings = { "undercurl" },
                        information = { "undercurl" },
                    },
                    inlay_hints = {
                        background = true,
                    },
                },
                rainbow_delimiters = true,
                semantic_tokens = true,
                telescope = { enabled = true },
                treesitter = true,
            },
            custom_highlights = function(C)
                return {
                    -- CmpItemAbbrMatch = { fg = C.red, bg = C.surface0 },
                    -- CmpItemAbbrMatchFuzzy = { fg = C.red, bg = C.surface0 },

                    -- PmenuSel = { fg = C.text, bg = C.base },
                    -- Pmenu = { fg = C.text, bg = C.base },
                    NormalFloat = { fg = C.text, bg = C.base },
                    -- CmpItemMenu = { fg = C.text, bg = C.base },
                    -- CursorLine = { fg = C.text, bg = C.surface0 },

                    FloatBorder = { fg = C.surface1, bg = C.base },

                    -- CmpItemKindSnippet = { fg = C.base, bg = C.mauve },
                    -- CmpItemKindKeyword = { fg = C.base, bg = C.red },
                    -- CmpItemKindText = { fg = C.base, bg = C.teal },
                    -- CmpItemKindMethod = { fg = C.base, bg = C.blue },
                    -- CmpItemKindConstructor = { fg = C.base, bg = C.blue },
                    -- CmpItemKindFunction = { fg = C.base, bg = C.blue },
                    -- CmpItemKindFolder = { fg = C.base, bg = C.blue },
                    -- CmpItemKindModule = { fg = C.base, bg = C.blue },
                    -- CmpItemKindConstant = { fg = C.base, bg = C.peach },
                    -- CmpItemKindField = { fg = C.base, bg = C.green },
                    -- CmpItemKindProperty = { fg = C.base, bg = C.green },
                    -- CmpItemKindEnum = { fg = C.base, bg = C.green },
                    -- CmpItemKindUnit = { fg = C.base, bg = C.green },
                    -- CmpItemKindClass = { fg = C.base, bg = C.yellow },
                    -- CmpItemKindVariable = { fg = C.base, bg = C.flamingo },
                    -- CmpItemKindFile = { fg = C.base, bg = C.blue },
                    -- CmpItemKindInterface = { fg = C.base, bg = C.yellow },
                    -- CmpItemKindColor = { fg = C.base, bg = C.red },
                    -- CmpItemKindReference = { fg = C.base, bg = C.red },
                    -- CmpItemKindEnumMember = { fg = C.base, bg = C.red },
                    -- CmpItemKindStruct = { fg = C.base, bg = C.blue },
                    -- CmpItemKindValue = { fg = C.base, bg = C.peach },
                    -- CmpItemKindEvent = { fg = C.base, bg = C.blue },
                    -- CmpItemKindOperator = { fg = C.base, bg = C.blue },
                    -- CmpItemKindTypeParameter = { fg = C.base, bg = C.blue },
                    -- CmpItemKindCopilot = { fg = C.base, bg = C.teal },
                }
            end,
        },
        config = function(_, opts)
            require("catppuccin").setup(opts)
            vim.cmd.colorscheme("catppuccin")
        end,
    },
    {
        "folke/tokyonight.nvim",
        enabled = false,
        event = "VeryLazy",
        priority = 1000,
        opts = {
            style = "day",
            day_brightness = 0.3,
            dim_inactive = true,
        },
        config = function(_, opts) require("tokyonight").setup(opts) end,
    },
    {
        "EdenEast/nightfox.nvim",
        enabled = false,
        event = "VeryLazy",
        opts = { options = { dim_inactive = true } },
        config = function(_, opts) require("nightfox").setup(opts) end,
    },
    -- { "nyoom-engineering/oxocarbon.nvim", event = "VeryLazy" },
    -- { "MetriC-DT/balance-theme.nvim", event = "VeryLazy" },
    -- { "NLKNguyen/papercolor-theme", event = "VeryLazy" },
    -- { "Shatur/neovim-ayu", event = "VeryLazy" },
    -- { "alexvzyl/nordic.nvim", event = "VeryLazy" },
    -- { "axvr/photon.vim", event = "VeryLazy" },
    -- { "cocopon/iceberg.vim", event = "VeryLazy" },
    -- { "d00h/nvim-rusticated", event = "VeryLazy" },
    -- { "jonathanfilip/vim-lucius", event = "VeryLazy" },
    -- { "marko-cerovac/material.nvim", event = "VeryLazy" },
    -- { "maxmx03/solarized.nvim", event = "VeryLazy" },
    -- { "navarasu/onedark.nvim", event = "VeryLazy" },
    -- { "neanias/everforest-nvim", event = "VeryLazy" },
    -- { "nyoom-engineering/nyoom.nvim", event = "VeryLazy" },
    -- { "owickstrom/vim-colors-paramount", event = "VeryLazy" },
    -- { "projekt0n/github-nvim-theme", event = "VeryLazy" },
    -- { "rakr/vim-one", event = "VeryLazy" },
    -- { "rebelot/kanagawa.nvim", event = "VeryLazy" },
    -- { "rmehri01/onenord.nvim", event = "VeryLazy" },
    -- { "ryanpcmcquen/true-monochrome_vim", event = "VeryLazy" },
    -- { "sainnhe/edge", event = "VeryLazy" },
    -- { "savq/melange-nvim", event = "VeryLazy" },
    -- { "scottmckendry/cyberdream.nvim", event = "VeryLazy" },
    -- { "shaunsingh/nord.nvim", event = "VeryLazy" },
    -- { "sonph/onehalf", event = "VeryLazy" },
    -- { "uloco/bluloco.nvim", event = "VeryLazy" },
    -- { "widatama/vim-phoenix", event = "VeryLazy" },
    -- { "wuelnerdotexe/vim-enfocado", event = "VeryLazy" },
    -- { "zenbones-theme/zenbones.nvim", dependencies = { "rktjmp/lush.nvim" }, event = "VeryLazy" },
}
