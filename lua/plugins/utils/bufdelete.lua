return {
    "famiu/bufdelete.nvim",
    event = "VeryLazy",
    init = function()
        local map = vim.keymap.set
        map("n", "<leader>bd", "<cmd>lua require('bufdelete').bufdelete(0, true)<cr>", { desc = "Buf Delete" })
        map("n", "<leader>bw", "<cmd>lua require('bufdelete').bufwipeout(0)<cr>", { desc = "Buf Wipeout" })
    end,
}
