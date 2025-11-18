return {
    "akinsho/bufferline.nvim",
    enabled = true,
    event = { "BufReadPre" },
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    -- opts = {},
    config = function()
        local bufferline = require("bufferline")
        bufferline.setup({
            options = {
                always_show_bufferline = false,
                diagnostics = "nvim_lsp",
                diagnostics_indicator = function(count, level, _, _)
                    local icon = "󰌶 "
                    if level == "error" then
                        icon = "󰅚 "
                    elseif level == "warning" then
                        icon = "󰀪 "
                    elseif level == "info" then
                        icon = " "
                    end
                    return " " .. icon .. count
                end,
                hover = { enabled = false },
                indicator = {
                    style = "none",
                },
                separator_style = "thin",
                separator_style = { "", "" },
                show_buffer_close_icons = false,
                show_buffer_icons = false,
                show_close_icon = false,
                tab_size = 0,
            },
        })
    end,
}
