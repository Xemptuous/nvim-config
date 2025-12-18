return {
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
}
