return {
    "folke/flash.nvim",
    keys = {
        { "ss", mode = { "n", "o", "x" }, function() require("flash").jump() end, desc = "Flash Jump" },
        { "sS", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        { "se", mode = "o", function() require("flash").remote() end, desc = "Flash Remote" },
        -- { "<leader>s", mode = { "n", "o", "x" }, function() require("flash").jump() end, desc = "Flash Jump" },
        -- { "<leader>S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        -- { "<leader>e", mode = "o", function() require("flash").remote() end, desc = "Flash Remote" },
        {
            "R",
            mode = { "o", "x" },
            function() require("flash").treesitter_search() end,
            desc = "Flash Treesitter Search",
        },
        { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Flash Toggle" },
    },
    config = function()
        vim.api.nvim_set_hl(0, "FlashMatch", { fg = "#89b4fa" })
        vim.api.nvim_set_hl(0, "FlashCurrent", { fg = "#a6e3a1" })
        vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#11111b", bg = "#f38ba8" })
    end,
}
