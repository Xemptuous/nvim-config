return {
    "folke/which-key.nvim",
    enabled = true,
    event = "VeryLazy",
    opts = {},
    keys = {
        {
            "<leader>?",
            function() require("which-key").show({ global = false }) end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
    -- config = function()
    --     require("which-key").add({
    --         { "<leader>t", group = "Telescope" },
    --         { "<leader>d", group = "Debugger" },
    --         { "<leader>g", group = "Git" },
    --         { "<leader>n", group = "NeoGit" },
    --         { "<leader>gt", group = "Toggle" },
    --         { "<leader>x", group = "Trouble" },
    --         { "<leader>c", group = "Trouble" },
    --     })
    -- end,
}
