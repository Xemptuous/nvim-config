return {
    "echasnovski/mini.diff",
    -- key = { "<leader>go" },
    event = { "VeryLazy" },
    opts = {
        mappings = {
            apply = "",
            reset = "",
            textobject = "",
            goto_first = "[H",
            goto_prev = "[h",
            goto_next = "]h",
            goto_last = "]H",
        },
    },
    config = function(_, opts)
        require("mini.diff").setup(opts)
        vim.api.nvim_set_keymap("n", "<leader>go", ":lua MiniDiff.toggle_overlay()<CR>", { noremap = true, desc = "Toggle Overlay" })
    end,
}
