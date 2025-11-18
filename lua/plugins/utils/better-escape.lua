return {
    "max397574/better-escape.nvim",
    event = { "InsertEnter" },
    commit = "7e86edafb8c7e73699e0320f225464a298b96d12",
    opts = {
        mapping = { "jk", "kj" },
        clear_empty_lines = false,
        keys = "<Esc>",
    },
    config = function(_, opts) require("better_escape").setup(opts) end,
}
