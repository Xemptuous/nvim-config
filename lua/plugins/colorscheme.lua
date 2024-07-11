return {
	{
		"catppuccin/nvim",
        enabled = true,
        lazy = false,
		priority = 1000,
        opts = {
            flavour = "latte",
            background = { -- :h background
                light = "latte",
                dark = "latte",
            },
            transparent_background = false,
            dim_inactive = {
                enabled = true,
                shade = "dark",
                percentage = 0.01,
            },
            styles = {
                comments = { "italic" },
                conditionals = { "italic" },
            },
            -- color_overrides = {
            --     all = {
            --         base = "#0d0d14",
            --         mantle = "#08080d",
            --     }
            -- },
            -- custom_highlights = {
            --     -- vim.cmd('hi def IlluminatedWordText gui=underline')
            --     vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#1e1e2e", underline = true }),
            --     vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#1e1e2e", underline = true }),
            --     vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#1e1e2e", underline = true }),
            --     -- vim.api.nvim_set_hl(0, 'FloatBorder', {fg = '#4fa6ed'})
            --     -- vim.api.nvim_set_hl(0, 'Pmenu', {fg = '#4fa6ed'})
            --     -- vim.api.nvim_set_hl(0, 'FloatBorder', {fg = '#4fa6ed', bg = "#313244"})
            -- },
            integrations = {
                cmp = true,
                flash = true,
                gitsigns = true,
                nvimtree = true,
                indent_blankline = { enabled = true },
                mason = true,
                lsp_saga = true,
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
                        background = true
                    }
                },
                semantic_tokens = true,
                rainbow_delimiters = true,
                telescope = true,
                treesitter = true
            },
        },
        config = function(_, opts)
            require("catppuccin").setup(opts)
            vim.cmd.colorscheme("catppuccin")
        end
	},
    {
        "zenbones-theme/zenbones.nvim",
        dependencies = {"rktjmp/lush.nvim"}
    },
    { "folke/tokyonight.nvim" },
    { "NLKNguyen/papercolor-theme" },
    { "MetriC-DT/balance-theme.nvim" },
    { "sainnhe/edge" },
    { "neanias/everforest-nvim" },
    { "projekt0n/github-nvim-theme" },
    { "Shatur/neovim-ayu" },
    { 'maxmx03/solarized.nvim' },
    { 'nyoom-engineering/nyoom.nvim' },
    { 'scottmckendry/cyberdream.nvim' },
    { 'preservim/vim-colors-pencil' },
    { 'yorik1984/newpaper.nvim' },
}
