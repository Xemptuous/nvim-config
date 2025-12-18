return {
    "numToStr/FTerm.nvim",
    keys = { "<A-t>", desc = "Toggle Float Terminal", mode = "n" },
    opts = {
        border = "single",
        width = 0.9,
        dimensions = {
            height = 0.9,
        },
    },
    config = function(_, opts)
        require("FTerm").setup(opts)
        vim.api.nvim_set_keymap("n", "<A-t>", "<cmd>lua require('FTerm').toggle()<cr>", {})
        vim.api.nvim_set_keymap("t", "<A-t>", "<C-\\><cmd>lua require('FTerm').toggle()<cr>", {})
    end,
}
