return {
    "mrcjkb/rustaceanvim",
    version = "^6", -- Recommended
    eventg = "VeryLazy",
    ft = { "rust", "toml" },
    config = function()
        -- local k = vim.keymap
        -- local bufnr = vim.api.nvim_get_current_buf()
        -- k.set("n", "K", function() vim.cmd.RustLsp({ "hover", "actions" }) end, {
        --     silent = true,
        --     buffer = bufnr,
        -- })
        vim.g.rustaceanvim = function()
            local opts = { silent = true, ubffer = bufnr }
            local r = function(cmd) vim.cmd.RustLsp(cmd) end
            local k = vim.keymap.set
            return {
                tools = {
                    float_win_config = {
                        border = "single",
                    },
                },
                -- other rustacean settings. --
                server = {
                    on_attach = function()
                        k("n", "K", function() r({ "hover", "actions" }) end, opts)
                        k("n", "\\u", function() r({ "moveItem", "up" }) end, opts)
                        k("n", "\\d", function() r({ "moveItem", "down" }) end, opts)
                        k("n", "<leader>rc", function() r({ "codeAction" }) end, opts)
                        k("n", "<leader>rC", function() r({ "openCargo" }) end, opts)
                        k("n", "\\a", "<Plug>RustHoverAction", opts)
                        -- k("n", "K", function() vim.cmd.RustLsp({ "hover", "actions" }) end, { silent = true, buffer = bufnr })
                        -- k("n", "<leader>rk", function() vim.cmd.RustLsp({ "moveItem", "up" }) end, { silent = true, buffer = burfnr })
                        -- other settings. --
                    end,
                },
            }
        end
    end,
    -- opts = {
    --     tools = {},
    --     server = {
    --         default_settings = {
    --             ["rust-analyzer"] = {
    --                 diagnostics = {
    --                     disabled = { "unlinked-file" },
    --                 },
    --                 cargo = {
    --                     allFeatures = true,
    --                 },
    --                 checkOnSave = {
    --                     command = "clippy",
    --                 },
    --             },
    --         },
    --     },
    -- },
    -- lazy = false, -- This plugin is already lazy
}
