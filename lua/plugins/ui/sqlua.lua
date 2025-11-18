return {
    "xemptuous/sqlua.nvim",
    cmd = "SQLua",
    config = function()
        -- require("sqlua").setup({
        --     load_connections_on_start = false,
        -- })
        require("sqlua").setup()
    end,
}
