local load_textobjects = false
return {
	{
		"nvim-treesitter/nvim-treesitter",
		priority = 700,
		dependencies = {
            {"HiPhish/rainbow-delimiters.nvim"},
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
                "cpp",
                "html",
                "htmldjango",
                "javascript",
                "json",
                "json5",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "vim",
            },
            highlight = {
                enable = true,
                use_languagetree = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
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
		lazy = true,
		event = "VeryLazy",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {
            show_current_context = true,
            show_current_context_start = false,
        }
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
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
