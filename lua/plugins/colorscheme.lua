return {
    -- {
    --     "rktjmp/lush.nvim",
    --     event = "VeryLazy",
    --     -- config = function()
    --     --     require("lazy").setup({
    --     --         { dir = "/home/xempt/Documents/test/lush", lazy = true },
    --     --     })
    --     -- end,
    -- },
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
                -- blink_cmp = true,
                -- dadbod_ui = true,
                flash = true,
                gitsigns = true,
                indent_blankline = { enabled = true },
                -- lsp_saga = true,
                -- mason = true,
                mini = { enabled = true, indenscope_color = "blue" },
                notify = true,
                -- nvim_surround = true,
                nvimtree = true,
                -- render_markdown = true,
                -- markdown = true,
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
                -- rainbow_delimiters = true,
                semantic_tokens = true,
                telescope = { enabled = true },
                treesitter = true,
            },
            custom_highlights = function(C)
                return {
                    NormalFloat = { fg = C.text, bg = C.base },
                    FloatBorder = { fg = C.surface1, bg = C.base },
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
        enabled = true,
        event = "VeryLazy",
        priority = 1000,
        opts = {
            style = "day",
            day_brightness = 0.3,
            dim_inactive = true,
        },
        config = function(_, opts) require("tokyonight").setup(opts) end,
    },
    -- {
    --     "EdenEast/nightfox.nvim",
    --     enabled = true,
    --     event = "VeryLazy",
    --     opts = { options = { dim_inactive = true } },
    --     config = function(_, opts) require("nightfox").setup(opts) end,
    -- },
    -- {
    --     "olivercederborg/poimandres.nvim",
    --     enabled = true,
    --     event = "VeryLazy",
    --     config = function() require("poimandres").setup({}) end,
    -- },
    -- { "NLKNguyen/papercolor-theme", event = "VeryLazy" },
    -- { "Shatur/neovim-ayu", event = "VeryLazy" },
    -- { "alexvzyl/nordic.nvim", event = "VeryLazy" },
    -- { "d00h/nvim-rusticated", event = "VeryLazy" },
    -- { "dgox16/oldworld.nvim", event = "VeryLazy" },
    -- { "jonathanfilip/vim-lucius", event = "VeryLazy" },
    -- { "marko-cerovac/material.nvim", event = "VeryLazy" },
    -- { "maxmx03/solarized.nvim", event = "VeryLazy" },
    -- { "navarasu/onedark.nvim", event = "VeryLazy" },
    -- { "neanias/everforest-nvim", event = "VeryLazy" },
    -- { "nyoom-engineering/oxocarbon.nvim", event = "VeryLazy" },
    -- { "projekt0n/github-nvim-theme", event = "VeryLazy" },
    -- { "rafamadriz/neon", event = "VeryLazy" },
    -- { "rakr/vim-one", event = "VeryLazy" },
    -- { "rebelot/kanagawa.nvim", event = "VeryLazy" },
    -- { "rmehri01/onenord.nvim", event = "VeryLazy" },
    -- { "sainnhe/edge", event = "VeryLazy" },
    -- { "savq/melange-nvim", event = "VeryLazy" },
    -- { "shaunsingh/nord.nvim", event = "VeryLazy" },
    -- { "tinted-theming/tinted-vim", event = "VeryLazy" },

    -- Light Themes
    -- { "MetriC-DT/balance-theme.nvim", event = "VeryLazy" },

    -- Muted Themes
    { "zenbones-theme/zenbones.nvim", dependencies = { "rktjmp/lush.nvim" }, event = "VeryLazy" },
    { "kvrohit/substrata.nvim", event = "VeryLazy" },
    { "slugbyte/lackluster.nvim", event = "VeryLazy" },
    { "davidosomething/vim-colors-meh", event = "VeryLazy" },
    -- { "Lokaltog/vim-monotone", event = "VeryLazy" },
    -- { "karoliskoncevicius/distilled-vim", event = "VeryLazy" },
    -- { "axvr/photon.vim", event = "VeryLazy" },
    -- { "cocopon/iceberg.vim", event = "VeryLazy" },
    -- { "darkvoid-theme/darkvoid.nvim", event = "VeryLazy" },
    -- { "jackplus-xyz/binary.nvim", event = "VeryLazy", opts = { colors = { fg = "#1e1e2e", bg = "#cdd6f4" } } },
    -- { "kdheepak/monochrome.nvim", event = "VeryLazy" },
    -- { "killitar/obscure.nvim", event = "VeryLazy" },
    -- { "kvrohit/rasmus.nvim", event = "VeryLazy" },
    -- { "mellow-theme/mellow.nvim", event = "VeryLazy" },
    -- { "owickstrom/vim-colors-paramount", event = "VeryLazy" },
    -- { "vague2k/vague.nvim", event = "VeryLazy", opts = {} },
    -- { "widatama/vim-phoenix", event = "VeryLazy" },
}
