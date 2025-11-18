return {
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
}
