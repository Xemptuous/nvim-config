return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    ft = { "markdown" },
    opts = {
        completions = {
            blink = { enabled = true },
            lsp = { enabled = true },
        },
    },
}
