local load_textobjects = false
return {
	{
		"nvim-treesitter/nvim-treesitter",
		priority = 700,
		dependencies = {
            {
                "nvim-treesitter/nvim-treesitter-textobjects",
                init = function()
                    require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
                    load_textobjects = true
                end,
            }
        },
        opts = {
            ensure_installed = {
                "bash",
                "c",
                "c_sharp",
                "cpp",
                "csv",
                "gitignore",
                "go",
                "html",
                "htmldjango",
                "javascript",
                "json",
                "json5",
                "lua",
                "luadoc",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "sql",
                "tsx",
                "typescript",
                "vim",
                "vimdoc",
                "zig",
            },
            highlight = {
                enable = true,
                use_languagetree = true,
                additional_vim_regex_highlighting = false,
            }, indent = {
                enable = true,
                disable = { "python" },
            },
            context_commentstring = {
                enable = true,
                enable_autocmd = false,
            },

        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
            if load_textobjects then
                -- PERF: no need to load the plugin, if we only need its queries for mini.ai
                if opts.textobjects then
                    for _, mod in ipairs({ "move", "select", "swap", "lsp_interop" }) do
                        if opts.textobjects[mod] and opts.textobjects[mod].enable then
                            local Loader = require("lazy.core.loader")
                            Loader.disabled_rtp_plugins["nvim-treesitter-textobjects"] = nil
                            local plugin = require("lazy.core.config").plugins["nvim-treesitter-textobjects"]
                            require("lazy.core.loader").source_runtime(plugin.dir, "plugin")
                            break
                        end
                    end
                end
            end
        end
	},
	{
		"lukas-reineke/indent-blankline.nvim",
        main= "ibl",
		lazy = true,
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
            local hooks = require "ibl.hooks"

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
            require("ibl").setup {
                debounce = 200,
                indent = {
                    -- char = "|"
                    char = "▏"
                },
                scope = {
                    highlight = highlight,
                    show_start = false,
                    show_end = false
                }
            }
            hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
            hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
            hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_tab_indent_level)
        end
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
        enabled = true,
		lazy = true,
		config = function()
            local rainbow_delimiters = require("rainbow-delimiters")

            vim.g.rainbow_delimiters = {
                strategy = {
                    [""] = rainbow_delimiters.strategy["global"],
                    vim = rainbow_delimiters.strategy["local"],
                },
                query = {
                    [""] = "rainbow-delimiters",
                    lua = "rainbow-blocks",
                },
                highlight = {
                    "RainbowDelimiterYellow",
                    "RainbowDelimiterBlue",
                    "RainbowDelimiterRed",
                    "RainbowDelimiterGreen",
                    "RainbowDelimiterOrange",
                    "RainbowDelimiterViolet",
                    "RainbowDelimiterCyan",
                },
            }
            vim.api.nvim_set_hl(0, "MatchParen", { fg = "#cdd6f4", bg = "#45475a" })
        end
	}
}
