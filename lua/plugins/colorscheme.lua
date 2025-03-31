return {
    {
        "catppuccin/nvim",
        enabled = true,
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
                aerial = true,
                cmp = true,
                blink_cmp = true,
                dadbod_ui = true,
                flash = true,
                gitsigns = true,
                indent_blankline = { enabled = true },
                lsp_saga = true,
                mason = true,
                mini = { enabled = true, indenscope_color = "blue" },
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
                    inlay_hints = { background = true },
                },
                rainbow_delimiters = true,
                semantic_tokens = true,
                telescope = { enabled = true },
                treesitter = true,
            },
            color_overrides = {},
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
    -- { "Shatur/neovim-ayu", event = "VeryLazy" },
    -- { "alexvzyl/nordic.nvim", event = "VeryLazy" }, -- nord but different
    -- { "marko-cerovac/material.nvim", event = "VeryLazy" },
    -- { "maxmx03/solarized.nvim", event = "VeryLazy" },
    -- { "rebelot/kanagawa.nvim", event = "VeryLazy" },
    -- { "rmehri01/onenord.nvim", event = "VeryLazy" },
    -- { "shaunsingh/nord.nvim", event = "VeryLazy" },
    -- { "navarasu/onedark.nvim", event = "VeryLazy" },
    -- { "projekt0n/github-nvim-theme", event = "VeryLazy" },
    -- { "neanias/everforest-nvim", event = "VeryLazy" },
    {
        "zenbones-theme/zenbones.nvim",
        dependencies = { "rktjmp/lush.nvim" },
        event = "VeryLazy",
    },
    -- { "tinted-theming/tinted-vim", event = "VeryLazy" }, -- lots of base16 and base24 themes

    -- Light Themes
    -- { "MetriC-DT/balance-theme.nvim", event = "VeryLazy" },
    -- { "kkga/vim-envy", event = "VeryLazy" }, -- simple grayscale
    -- { "holidaycereal/notation.nvim", event = "VeryLazy" }, -- very notepad++y
    -- { "d00h/nvim-rusticated", event = "VeryLazy" }, -- very 90s style colors with beige-ish background

    -- Muted Light && Dark
    { "alexxGmZ/e-ink.nvim", event = "VeryLazy" }, -- bluish muted, similar to nord
    -- { "ronisbr/nano-theme.nvim", event = "VeryLazy" }, -- bluish muted, similar to nord
    -- { "eihigh/vim-aomi-grayscale", event = "VeryLazy" }, -- mostly monochrome with colored functions
    -- { "jaredgorski/Mies.vim", event = "VeryLazy" }, -- grayscale font
    -- { "ntk148v/komau.vim", event = "VeryLazy" }, -- muted monochrome
    -- { "jackplus-xyz/binary.nvim", event = "VeryLazy", opts = {} }, -- pure white or black with no formats (bold, italic, etc.)
    -- { "cocopon/iceberg.vim", event = "VeryLazy" }, -- muted with blue tones
    -- { "kdheepak/monochrome.nvim", event = "VeryLazy" }, -- grayscale with high contrast diff between dark and light
    -- { "owickstrom/vim-colors-paramount", event = "VeryLazy" }, -- grayscale/monochrome with purple accents

    -- Muted Light Themes

    -- Muted Dark Themes
    -- { "kvrohit/substrata.nvim", event = "VeryLazy" }, -- bluish muted colors
    { "slugbyte/lackluster.nvim", event = "VeryLazy" }, -- multiple variants; muted and grayscale with some colorization
    -- { "rjshkhr/shadow.nvim", event = "VeryLazy" },
    -- { "masar3141/mono-jade", event = "VeryLazy" }, -- very dark muted with slight green tinge
    -- { "dzfrias/noir.nvim", event = "VeryLazy" }, -- extremely dark muted colors
    -- { "sho-87/kanagawa-paper.nvim", event = "VeryLazy" }, -- slightly more color than kanagawabones
    -- { "igemnace/highlight.vim", event = "VeryLazy" }, -- monochrome with some colors only where "important"
    -- { "kar9222/minimalist.nvim", event = "VeryLazy" }, -- mostly desaturated, some colors on significant keywords
    -- { "teloe/bland.vim", event = "VeryLazy" }, -- muted with slight color
    -- { "davidosomething/vim-colors-meh", event = "VeryLazy" }, -- mostly grayscale with some important colors; reds and pale blues
    -- { "Lokaltog/vim-monotone", event = "VeryLazy" }, -- very grayscale/monochrome
    -- { "axvr/photon.vim", event = "VeryLazy" }, -- monochrome with purple accent
    -- { "darkvoid-theme/darkvoid.nvim", event = "VeryLazy" }, -- all monochrome with ops/signs colored bright
    -- { "killitar/obscure.nvim", event = "VeryLazy" }, -- muted with many colors
    -- { "kvrohit/rasmus.nvim", event = "VeryLazy" }, -- vscode-y muted
    -- { "mellow-theme/mellow.nvim", event = "VeryLazy" }, -- pale colored muted with pinks and purples
    -- { "vague2k/vague.nvim", event = "VeryLazy", opts = {} }, -- muted similar to kanagawa colors
    -- { "widatama/vim-phoenix", event = "VeryLazy" }, -- mostly monochrome with lots of blues
    -- { "ficcdaf/ashen.nvim", event = "VeryLazy" }, -- red and orange, like autumn
}
