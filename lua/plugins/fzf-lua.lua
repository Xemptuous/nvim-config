return {
    "ibhagwan/fzf-lua",
    enabled = false,
    event = "VeryLazy",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "nvim-mini/mini.icons" },
    opts = {
        cmd = { "skim" },
    },
    config = function()
        local f = require("fzf-lua")
        local k = vim.keymap.set
        k("n", "<leader>fk", ":lua FzfLua.files()<CR>", { desc = "Find File" })
    end,
}
