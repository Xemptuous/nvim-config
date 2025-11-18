return {
    "numToStr/Comment.nvim",
    enabled = false,
    keys = { "gc", "V" },
    config = function() require("Comment").setup() end,
}
