return {
    "folke/noice.nvim",
    enabled = true,
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        -- "rcarriga/nvim-notify",
    },
    opts = {
        cmdline = {
            opts = {
                win_options = { winblend = 0 },
            },
        },
        lsp = {
            -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
            },
            hover = { enabled = true },
            signature = { enabled = true },
        },
        presets = {
            bottom_search = false,
            command_palette = true, -- position the cmdline and popupmenu together
            long_message_to_split = false,
            inc_rename = false, -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = true,
        },
        messages = { enabled = false },
        redirect = { view = "messages" },
        popupmenu = { enabled = false },
        health = { checker = false },
    },
}
