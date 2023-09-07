local rainbow_delimiters = require("rainbow-delimiters")

vim.g.rainbow_delimiters = {
    strategy = {
        [""] = rainbow_delimiters.strategy["global"],
        vim = rainbow_delimiters.strategy["local"],
    },
    query = {
        [""] = "rainbow-delimiters",
        lua = "rainbow-blocks",
    },
    highlight = {
        "RainbowDelimiterYellow",
        "RainbowDelimiterBlue",
        "RainbowDelimiterRed",
        "RainbowDelimiterGreen",
        "RainbowDelimiterOrange",
        "RainbowDelimiterViolet",
        "RainbowDelimiterCyan",
    },
}
vim.api.nvim_set_hl(0, "MatchParen", { fg = "#cdd6f4", bg = "#45475a" })
