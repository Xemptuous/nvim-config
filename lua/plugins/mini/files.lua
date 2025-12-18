return {
    "echasnovski/mini.files",
    enabled = false,
    event = "VeryLazy",
    keys = "<C-t>",
    dependencies = "echasnovski/mini.icons",
    init = function()
        vim.api.nvim_create_autocmd({ "VimEnter" }, {
            callback = function(data)
                local directory = vim.fn.isdirectory(data.file) == 1
                if not directory then return end

                vim.cmd.enew()
                vim.cmd.bw(data.buf)
                vim.cmd.cd(data.file)
                require("mini.files").open()
            end,
        })
    end,
    opts = {
        options = {
            use_as_default_explorer = false,
        },
        windows = {
            preview = true,
            width_focus = 30,
            width_nofocus = 15,
            width_preview = 60,
            winblend = 0,
        },
    },
    config = function(_, opts)
        local m = require("mini.files")
        m.setup(opts)
        vim.keymap.set("n", "<C-t>", function()
            if not m.close() then m.open() end
        end)
    end,
}
