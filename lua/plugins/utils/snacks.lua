return {
    "folke/snacks.nvim",
    enabled = true,
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = {
            enabled = true,
            notify = false,
            size = 1 * 1024 * 1024,
        },
        dashboard = {
            enabled = false,
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
            animate = { enabled = false },
            only_current = false,
            only_scope = false,
            scope = {
                only_current = false,
            },
        },
        input = {
            enabled = false,
            backdrop = false,
            relative = "cursor",
            row = -3,
            col = 0,
        },
        picker = { enabled = true },
        quickfile = { enabled = true },
        scroll = {
            enabled = false,
            animate = {
                duration = { step = 15, total = 250 },
                easing = "linear",
            },
        },
        statuscolumn = { enabled = false },
        terminal = {
            enabled = false,
            win = {
                style = "terminal",
                input = { -- list, preview
                    keys = {
                        ["<C-h>"] = { "<C-w>h", expr = true, mode = { "i", "n" } },
                        ["<C-j>"] = { "<C-w>j", expr = true, mode = { "i", "n" } },
                        ["<C-k>"] = { "<C-w>k", expr = true, mode = { "i", "n" } },
                        ["<C-l>"] = { "<C-w>l", expr = true, mode = { "i", "n" } },
                    },
                },
            },
        },
        words = { enabled = false },
    },
    keys = {
        { "<leader>.", function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
        { "<leader>p", function() Snacks.picker() end, desc = "Snacks Picker" },
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
}
