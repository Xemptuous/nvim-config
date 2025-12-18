return {
    "NeogitOrg/neogit",
    keys = { "<leader>ng" },
    cmd = { "Neogit" },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "nvim-telescope/telescope.nvim",
        -- "nvim-tree/nvim-web-devicons",
        "echasnovski/mini.icons",
    },
    -- config = true,
    config = function()
        require("neogit").setup({
            mappings = {
                popup = { ["l"] = false, ["L"] = "LogPopup" },
            },
        })
        vim.api.nvim_set_keymap("n", "<leader>ng", [[:Neogit<CR>]], { noremap = true, desc = "NeoGit" })
    end,
}
