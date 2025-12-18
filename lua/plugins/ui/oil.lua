return {
    "stevearc/oil.nvim",
    enabled = true,
    keys = { "<C-t>", "<leader>o" },
    cmd = "Oil",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    init = function(_, _)
        vim.api.nvim_create_autocmd({ "VimEnter" }, {
            callback = function(data)
                local isDir = vim.fn.isdirectory(data.file) == 1
                if not isDir then return end
                require("oil").setup({
                    keymaps = { ["<C-t>"] = {} },
                    float = { border = "single" },
                    win_options = { signcolumn = "yes:2" },
                    view_options = { show_hidden = true },
                })
            end,
        })
    end,
    opts = {
        win_options = { signcolumn = "yes:2" },
        float = {
            -- max_width = 150,
            -- max_height = 40,
            border = "single",
        },
        view_options = {
            show_hidden = false,
            is_hidden_file = function(name, bufnr)
                if name == "__pycache__" then return true end
                local m = name:match("^%.")
                return m ~= nil
            end,
        },
        keymaps = {
            ["<C-t>"] = {},
            ["g?"] = { "actions.show_help", mode = "n" },
            ["<CR>"] = "actions.select",
            ["<C-s>"] = { "actions.select", opts = { vertical = true } },
            ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
            -- ["<C-t>"] = { "actions.select", opts = { tab = true } },
            ["<C-p>"] = "actions.preview",
            ["<C-c>"] = { "actions.close", mode = "n" },
            ["<C-l>"] = "actions.refresh",
            ["-"] = { "actions.parent", mode = "n" },
            ["_"] = { "actions.open_cwd", mode = "n" },
            ["`"] = { "actions.cd", mode = "n" },
            ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
            ["gs"] = { "actions.change_sort", mode = "n" },
            ["gx"] = "actions.open_external",
            ["g."] = { "actions.toggle_hidden", mode = "n" },
            ["g\\"] = { "actions.toggle_trash", mode = "n" },
        },
    },
    config = function(_, opts)
        require("oil").setup(opts)
        vim.keymap.set("n", "<leader>o", function() vim.cmd((vim.bo.filetype == "oil") and "bd" or "Oil") end)
        vim.keymap.set("n", "<C-t>", function() vim.cmd((vim.bo.filetype == "oil") and "bd" or "Oil --float --preview") end)
    end,
}
