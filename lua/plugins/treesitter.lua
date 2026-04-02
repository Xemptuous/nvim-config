return {
    {
        "nvim-treesitter/nvim-treesitter",
        enabled = true,
        build = ":TSUpdate",
        -- branch = "master",
        lazy = false,
        event = "VeryLazy",
        dependencies = {
            -- "nvim-treesitter/nvim-treesitter-context",
            {
                "HiPhish/rainbow-delimiters.nvim",
                enabled = false,
                submodules = false,
                event = "VeryLazy",
                disable = { "rust" },
                main = "rainbow-delimiters.setup",
                opts = {
                    query = {
                        [""] = "rainbow-delimiters",
                        lua = "rainbow-blocks",
                        elixir = "rainbow-blocks",
                    },
                    highlight = {
                        "RainbowDelimiterViolet",
                        "RainbowDelimiterYellow",
                        "RainbowDelimiterBlue",
                        -- "RainbowDelimiterRed",
                        "RainbowDelimiterGreen",
                        "RainbowDelimiterOrange",
                        "RainbowDelimiterCyan",
                    },
                },
            },
        },
        opts = {
            auto_install = false,
            highlight = {
                enable = true,
                use_languagetree = true,
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },
            context_commentstring = {
                enable = true,
                enable_autocmd = false,
            },
        },
        -- config = function(_, opts) require("nvim-treesitter.configs").setup(opts) end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        enabled = false,
        main = "ibl",
        event = "VeryLazy",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            local highlight = {
                "RainbowYellow",
                "RainbowBlue",
                "RainbowRed",
                "RainbowGreen",
                "RainbowOrange",
                "RainbowViolet",
                "RainbowCyan",
            }
            local hooks = require("ibl.hooks")

            -- create the highlight groups in the highlight setup hook, so they are reset
            -- every time the colorscheme changes
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
                vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
                vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
                vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
                vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
                vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
                vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
            end)

            vim.g.rainbow_delimiters = { highlight = highlight }
            require("ibl").setup({
                debounce = 200,
                indent = {
                    -- char = "|"
                    char = "▏",
                },
                scope = {
                    highlight = highlight,
                    show_start = false,
                    show_end = false,
                },
            })
            hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
            hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
            hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_tab_indent_level)
        end,
    },
    {
        "tree-sitter-grammars/tree-sitter-hyprlang",
        enabled = false,
        dependencies = "nvim-treesitter/nvim-treesitter",
        lazy = false,
        config = function()
            vim.filetype.add({
                pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
            })
        end,
    },
}
