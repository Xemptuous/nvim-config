return {
    {
        "michaelb/sniprun",
        cmd = "SnipRun",
        build = "sh ./install.sh",
        config = function() require("sniprun").setup({}) end,
    },
    {
        "max397574/better-escape.nvim",
        event = { "InsertEnter" },
        commit = "7e86edafb8c7e73699e0320f225464a298b96d12",
        opts = {
            mapping = { "jk", "kj" },
            clear_empty_lines = false,
            keys = "<Esc>",
        },
        config = function(_, opts) require("better_escape").setup(opts) end,
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = { check_ts = true },
    },
    {
        "kylechui/nvim-surround",
        enabled = false,
        keys = { "ys", "yS" },
        opts = {},
    },
    {
        "alvan/vim-closetag",
        ft = { "html", "djangohtml", "htmldjango" },
    },
    {
        "numToStr/Comment.nvim",
        enabled = false,
        keys = { "gc", "V" },
        config = function() require("Comment").setup() end,
    },
    { "Vimjas/vim-python-pep8-indent", enabled = false, ft = { "python", "py" } },
    {
        "folke/flash.nvim",
        keys = {
            { "<leader>s", mode = { "n", "o", "x" }, function() require("flash").jump() end, desc = "Flash Jump" },
            { "<leader>S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "<leader>e", mode = "o", function() require("flash").remote() end, desc = "Flash Remote" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Flash Treesitter Search" },
            { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Flash Toggle" },
        },
        config = function()
            vim.api.nvim_set_hl(0, "FlashMatch", { fg = "#89b4fa" })
            vim.api.nvim_set_hl(0, "FlashCurrent", { fg = "#a6e3a1" })
            vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#11111b", bg = "#f38ba8" })
        end,
    },
    {
        "lambdalisue/suda.vim",
        enabled = false,
        cmd = "SudaWrite",
        keys = { "<leader>sw", mode = "n", "<cmd>SudaWrite<cr>", desc = "Sudo Write" },
    },
    { -- parse and color ansi escape color codes
        "m00qek/baleia.nvim",
        enabled = false,
        cmd = { "BaleiaColorize" },
        config = function() require("baleia").setup({}) end,
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            require("which-key").add({
                { "<leader>t", group = "Telescope" },
                { "<leader>d", group = "Debugger" },
                { "<leader>g", group = "Git" },
                { "<leader>n", group = "NeoGit" },
                { "<leader>gt", group = "Toggle" },
                { "<leader>x", group = "Trouble" },
                { "<leader>c", group = "Trouble" },
            })
        end,
    },
    { "tpope/vim-abolish", keys = "cr" },
    { "kevinhwang91/nvim-bqf", ft = { "qf" } },
    { "jidn/vim-dbml", enabled = false, ft = { "dbml" } },
    { "chrisbra/unicode.vim", event = "VeryLazy" },
    {
        "MagicDuck/grug-far.nvim",
        cmd = "GrugFar",
        config = function() require("grug-far").setup({}) end,
    },
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        keys = {
            { "<leader>.", function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
            { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse" },
            { "\\z", function() Snacks.zen() end, desc = "Toggle Zen Mode" },
            { "]]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
            { "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
        },
        opts = {
            bigfile = { enabled = true },
            dashboard = { enabled = true },
            dim = { enabled = true, animate = { enabled = false } },
            gitbrowse = { enabled = true },
            indent = { enabled = false, scope = { only_current = true, animate = { enabled = false } } },
            input = { enabled = true },
            quickfile = { enabled = false },
            scroll = { enabled = false, animate = { duration = { step = 15, total = 250 }, easing = "linear" } },
            statuscolumn = { enabled = false },
            words = { enabled = false },
        },
        init = function()
            vim.api.nvim_create_autocmd("User", {
                pattern = "MiniFilesActionRename",
                callback = function(event) Snacks.rename.on_rename_file(event.data.from, event.data.to) end,
            })
            vim.api.nvim_create_autocmd("User", {
                pattern = "VeryLazy",
                callback = function()
                    -- -- Setup some globals for debugging (lazy-loaded)
                    -- _G.dd = function(...)
                    -- 	Snacks.debug.inspect(...)
                    -- end
                    -- _G.bt = function()
                    -- 	Snacks.debug.backtrace()
                    -- end
                    vim.print = _G.dd -- Override print to use snacks for `:=` command
                    Snacks.toggle.treesitter():map("\\t")
                    Snacks.toggle.inlay_hints():map("\\h")
                    Snacks.toggle.line_number():map("\\l")
                    Snacks.toggle.option("wrap", { name = "Wrap" }):map("\\w")
                    Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("\\r")
                    Snacks.toggle.option("ignorecase", { name = "Ignore Case" }):map("\\i")
                    Snacks.toggle.option("hlsearch", { name = "Highlight Search" }):map("\\s")
                    Snacks.toggle.dim():map("\\d")
                    Snacks.toggle.indent():map("\\I")
                end,
            })
        end,
    },
}
