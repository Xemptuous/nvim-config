return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "diff", "diagnostics" },
            lualine_c = { "filename" },
            lualine_x = { "filetype" },
            lualine_y = {},
            lualine_z = { "location", "selectioncount" },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { "filename", "diff", "diagnostics" },
            lualine_x = {},
            lualine_y = {},
            lualine_z = { "location" },
        },
    },
}
