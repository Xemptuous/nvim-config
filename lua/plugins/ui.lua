return {
    {
        "NeogitOrg/neogit",
        keys = { "<leader>ng" },
        cmd = { "Neogit" },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "nvim-telescope/telescope.nvim",
            -- "nvim-tree/nvim-web-devicons",
            "echasnovski/mini.icons",
        },
        -- config = true,
        config = function()
            require("neogit").setup({
                mappings = {
                    popup = {
                        ["l"] = false,
                        ["L"] = "LogPopup",
                    },
                },
            })
            vim.api.nvim_set_keymap("n", "<leader>ng", [[:Neogit<CR>]], { noremap = true, desc = "NeoGit" })
        end,
    },
    { "tpope/vim-fugitive", enabled = false, event = "VeryLazy" },
    {
        "lewis6991/gitsigns.nvim",
        -- enabled = false,
        event = "VeryLazy",
        opts = {
            signcolumn = false, -- Toggle with `:Gitsigns toggle_signs`
            numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
            linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
            word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
            on_attach = function(bufnr)
                local gitsigns = require("gitsigns")

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map("n", "]g", function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "]c", bang = true })
                    else
                        gitsigns.nav_hunk("next")
                    end
                end, { desc = "Next" })

                map("n", "[g", function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "[c", bang = true })
                    else
                        gitsigns.nav_hunk("prev")
                    end
                end, { desc = "Previous" })

                -- Actions
                map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "Stage Hunk" })
                map("v", "<leader>gs", function() gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { desc = "Stage Hunk" })
                map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Reset Hunk" })
                map("v", "<leader>gr", function() gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { desc = "Reset Hunk" })
                map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "Stage Buffer" })
                map("n", "<leader>gu", gitsigns.undo_stage_hunk, { desc = "Undo Stage Hunk" })
                map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "Reset Buffer" })
                map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Preview Hunk" })
                map("n", "<leader>gb", gitsigns.toggle_current_line_blame, { desc = "Toggle Current Line Blame" })
                map("n", "<leader>gB", function() gitsigns.blame_line({ full = true }) end, { desc = "Blame Line" })
                map("n", "<leader>gd", gitsigns.diffthis, { desc = "Diff This" })
                map("n", "<leader>gq", gitsigns.setqflist, { desc = "Set Quickfix List" })
                map("n", "<leader>gl", gitsigns.setloclist, { desc = "Set Location List" })
                map("n", "<leader>gD", function() gitsigns.diffthis("~") end, { desc = "Diff This HEAD~" })
                map("n", "\\gd", gitsigns.toggle_deleted, { desc = "Toggle Deleted" })
                map("n", "\\gs", "<cmd>:Gitsigns toggle_signs<cr>", { desc = "Toggle Signs" })
                map("n", "\\gn", "<cmd>:Gitsigns toggle_numhl<cr><cmd>:lua MiniDiff.toggle()<cr>", { desc = "Toggle Number Highlight" })
                map("n", "\\gl", "<cmd>:Gitsigns toggle_linehl<cr>", { desc = "Toggle Line Highlight" })
                map("n", "\\gw", "<cmd>:Gitsigns toggle_word_diff<cr>", { desc = "Toggle Word Diff" })
                -- Text object
                map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select Hunk" })
            end,
        },
    },
    {
        "kristijanhusak/vim-dadbod-ui",
        enabled = false,
        cmd = { "DBUI" },
        dependencies = {
            "tpope/vim-dadbod",
            -- { "kristijanhusak/vim-dadbod-completion", cmd = { "DBUI" }, ft = { "sql", "mysql", "plsql" } },
        },
    },
    {
        "xemptuous/sqlua.nvim",
        cmd = "SQLua",
        config = function()
            require("sqlua").setup({
                load_connections_on_start = false,
            })
        end,
    },
    {
        "2kabhishek/nerdy.nvim",
        cmd = "Nerdy",
        dependencies = {
            "stevearc/dressing.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = function() require("telescope").load_extension("nerdy") end,
    },
    -- { "glench/vim-jinja2-syntax", ft = { "html", "sql" } },
    {
        "numToStr/FTerm.nvim",
        keys = { "<A-t>", desc = "Toggle Float Terminal", mode = "n" },
        opts = {
            border = "single",
            width = 0.9,
            dimensions = {
                height = 0.9,
            },
        },
        config = function(_, opts)
            require("FTerm").setup(opts)
            vim.api.nvim_set_keymap("n", "<A-t>", "<cmd>lua require('FTerm').toggle()<cr>", {})
            vim.api.nvim_set_keymap("t", "<A-t>", "<C-\\><cmd>lua require('FTerm').toggle()<cr>", {})
        end,
    },
    {
        "folke/trouble.nvim",
        opts = {},
        config = function() require("trouble").setup() end,
        cmd = "Trouble",
        keys = {
            { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
            { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
            { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
            { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
        },
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
    },
    {
        "folke/noice.nvim",
        enabled = false,
        event = "BufReadPost",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
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
            -- you can enable a preset for easier configuration
            presets = {
                bottom_search = true, -- use a classic bottom cmdline for search
                command_palette = true, -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false, -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = true, -- add a border to hover docs and signature help
            },
            health = { checker = false },
        },
    },
    {
        "stevearc/oil.nvim",
        keys = "<C-t>",
        cmd = "Oil",
        dependencies = "echasnovski/mini.icons",
        init = function(_, opts)
            vim.api.nvim_create_autocmd({ "VimEnter" }, {
                callback = function(data)
                    if vim.fn.isdirectory(data.file) ~= 1 then return end

                    require("oil").setup({ keymaps = { ["<C-t>"] = {} } })
                end,
            })
        end,
        opts = { keymaps = { ["<C-t>"] = {} } },
        config = function(_, opts)
            require("oil").setup(opts)
            vim.keymap.set("n", "<C-t>", function() vim.cmd((vim.bo.filetype == "oil") and "bd" or "Oil --float") end)
        end,
    },
}
