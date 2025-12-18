return {
    "michaelb/sniprun",
    cmd = "SnipRun",
    build = "sh ./install.sh",
    config = function() require("sniprun").setup({}) end,
}
