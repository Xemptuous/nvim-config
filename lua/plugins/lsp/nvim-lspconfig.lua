return {
    "neovim/nvim-lspconfig",
    lazy = true,
    dependencies = {
        "rafamadriz/friendly-snippets",
        "MeanderingProgrammer/render-markdown.nvim",
        "saghen/blink.cmp",
        {
            "mason-org/mason.nvim",
            event = "VeryLazy",
            opts = {},
            main = "mason",
        },
    },
    init = function()
        -- use nvim-lspconfig configs for native lsp
        local lspConfigPath = require("lazy.core.config").options.root .. "/nvim-lspconfig"
        vim.opt.runtimepath:append(lspConfigPath)

        vim.opt.signcolumn = "yes"
        vim.diagnostic.config({
            -- virtual_lines = { current_line = true },
            underline = false,
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "󰅚 ",
                    [vim.diagnostic.severity.WARN] = "󰀪 ",
                    [vim.diagnostic.severity.HINT] = "󰌶 ",
                    [vim.diagnostic.severity.INFO] = " ",
                },
            },
            update_in_insert = false,
            severity_sort = true,
            float = {
                border = "single",
                -- source = "always",
                header = "",
                -- prefix = "",
            },
        })

        vim.lsp.set_log_level("error")
        local lsp_dir = vim.fn.stdpath("config") .. "/lsp"
        local fs_dir = vim.uv.fs_opendir(lsp_dir, nil, 100)
        if fs_dir then
            local files = vim.uv.fs_readdir(fs_dir)
            for _, file in pairs(files) do
                if not string.find(file.name, ".bak") then
                    local fn = file.name:match("(.+)%..+")
                    vim.lsp.enable(fn)
                end
            end
        end
    end,
}
