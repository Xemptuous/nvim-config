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
        config = true,
        opts = {},
    },
    {
        "altermo/ultimate-autopair.nvim",
        enabled = false,
        event = { "InsertEnter", "CmdlineEnter" },
        branch = "v0.6",
        opts = {
            cmap = false,
            pair_cmap = false,
        },
    },
    {
        "kylechui/nvim-surround",
        enabled = false,
        keys = { "ys", "yS" },
        opts = {},
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
            { "ss", mode = { "n", "o", "x" }, function() require("flash").jump() end, desc = "Flash Jump" },
            { "sS", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "se", mode = "o", function() require("flash").remote() end, desc = "Flash Remote" },
            -- { "<leader>s", mode = { "n", "o", "x" }, function() require("flash").jump() end, desc = "Flash Jump" },
            -- { "<leader>S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            -- { "<leader>e", mode = "o", function() require("flash").remote() end, desc = "Flash Remote" },
            {
                "R",
                mode = { "o", "x" },
                function() require("flash").treesitter_search() end,
                desc = "Flash Treesitter Search",
            },
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
        "folke/which-key.nvim",
        enabled = false,
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
    {
        "famiu/bufdelete.nvim",
        event = "VeryLazy",
        init = function()
            local map = vim.keymap.set
            map("n", "<leader>bd", "<cmd>lua require('bufdelete').bufdelete(0, true)<cr>", { desc = "Buf Delete" })
            map("n", "<leader>bw", "<cmd>lua require('bufdelete').bufwipeout(0)<cr>", { desc = "Buf Wipeout" })
        end,
    },
    {
        "stevearc/aerial.nvim",
        keys = "<leader>A",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {
            auto_jump = true,
            backends = { "lsp", "treesitter", "markdown", "asciidoc", "man" },
            on_attach = function(bufnr)
                vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
                vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
            end,
        },
        config = function(_, opts)
            require("aerial").setup(opts)
            vim.keymap.set("n", "<leader>A", "<cmd>AerialNavToggle<CR>")
            vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
        end,
    },
    -- { "jidn/vim-dbml", ft = { "dbml" } },
    { "chrisbra/unicode.vim", event = "VeryLazy" },
    {
        "MagicDuck/grug-far.nvim",
        cmd = "GrugFar",
        config = function() require("grug-far").setup({}) end,
    },
    {
        -- should be implemented in 0.12+ according to roadmap
        enabled = false,
        "jake-stewart/auto-cmdheight.nvim",
        lazy = false,
        opts = {
            max_lines = 10,
            duration = 2,
            remove_on_key = true,
            clear_always = false,
        },
    },
    {
        "folke/snacks.nvim",
        enabled = false,
        priority = 1000,
        lazy = false,
        opts = {
            bigfile = { enabled = true },
            dashboard = {
                enabled = true,
                sections = {
                    { section = "header" },
                    { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
                    { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
                    { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
                    { section = "startup" },
                },
            },
            dim = { enabled = false, animate = { enabled = false } },
            gitbrowse = { enabled = false },
            indent = {
                enabled = false,
                scope = {
                    only_current = true,
                    animate = { enabled = false },
                },
            },
            input = {
                enabled = false,
                backdrop = false,
                relative = "cursor",
                row = -3,
                col = 0,
            },
            picker = { enabled = false },
            quickfile = { enabled = false },
            scroll = {
                enabled = false,
                animate = {
                    duration = { step = 15, total = 250 },
                    easing = "linear",
                },
            },
            statuscolumn = { enabled = true },
            terminal = {
                enabled = false,
                win = { style = "terminal" },
            },
            words = { enabled = false },
        },
        keys = {
            { "<leader>.", function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
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
