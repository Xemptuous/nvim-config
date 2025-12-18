return {
    "echasnovski/mini-git",
    enabled = false,
    event = "CmdlineEnter",
    config = function() require("mini.git").setup() end,
}
