return { -- parse and color ansi escape color codes
    "m00qek/baleia.nvim",
    enabled = false,
    cmd = { "BaleiaColorize" },
    config = function() require("baleia").setup({}) end,
}
