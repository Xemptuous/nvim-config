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
                    popup = { ["l"] = false, ["L"] = "LogPopup" },
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
                -- stylua: ignore start
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
                map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select Hunk" })
                -- stylua: ignore end
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
            -- require("sqlua").setup({
            --     load_connections_on_start = false,
            -- })
            require("sqlua").setup()
        end,
    },
    {
        "2kabhishek/nerdy.nvim",
        cmd = "Nerdy",
        dependencies = { "stevearc/dressing.nvim" },
        opts = {
            max_recents = 30,
            add_default_keybinding = false,
            use_new_command = true,
        },
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
    -- {
    --     "akinsho/toggleterm.nvim",
    --     event = "VeryLazy",
    --     version = "*",
    --     opts = {},
    -- },
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
        event = "VeryLazy",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
    },
    {
        "folke/noice.nvim",
        enabled = true,
        event = "VeryLazy",
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
    },
    {
        "stevearc/oil.nvim",
        enabled = true,
        keys = { "<C-t>", "<leader>o" },
        cmd = "Oil",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        -- init = function(_, _)
        --     vim.api.nvim_create_autocmd({ "VimEnter" }, {
        --         callback = function(data)
        --             local isDir = vim.fn.isdirectory(data.file) == 1
        --             if not isDir then return end
        --             require("oil").setup({
        --                 keymaps = { ["<C-t>"] = {} },
        --                 win_options = { signcolumn = "yes:2" },
        --                 view_options = { show_hidden = true },
        --             })
        --         end,
        --     })
        -- end,
        opts = {
            win_options = { signcolumn = "yes:2" },
            view_options = {
                show_hidden = true,
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
            vim.keymap.set("n", "<C-t>", function() vim.cmd((vim.bo.filetype == "oil") and "bd" or "Oil --float") end)
        end,
    },
    {
        "refractalize/oil-git-status.nvim",
        enabled = false,
        event = "VeryLazy",
        dependencies = { "stevearc/oil.nvim" },
        config = true,
    },
    {
        "j-hui/fidget.nvim",
        enabled = false,
        event = "VeryLazy",
        opts = {},
    },
    {
        "maan2003/lsp_lines.nvim",
        enabled = false,
        event = "VeryLazy",
        config = function()
            local l = require("lsp_lines")
            l.setup()
            vim.keymap.set("", "\\l", l.toggle, { desc = "Toggle lsp_lines" })
        end,
    },
    {
        "stevearc/overseer.nvim",
        enabled = false,
        event = "VeryLazy",
        keys = {
            { "<leader>R", "<cmd>OverseerRun<cr>", desc = "Toggle Overseer Run" },
            { "<leader>O", "<cmd>OverseerToggle<cr>", desc = "Toggle Overseer Task List" },
        },
        opts = {},
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {},
    },
    {
        "m4xshen/hardtime.nvim",
        enabled = false,
        lazy = false,
        dependencies = { "MunifTanjim/nui.nvim" },
        opts = {},
    },
    {
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
    },
    {
        "b0o/incline.nvim",
        event = "VeryLazy",
        config = function()
            local devicons = require("nvim-web-devicons")
            require("incline").setup({
                render = function(props)
                    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
                    if filename == "" then filename = "[No Name]" end
                    local ft_icon, ft_color = devicons.get_icon_color(filename)

                    local function get_git_diff()
                        -- local icons = { removed = " ", changed = " ", added = " " }
                        local icons = { removed = " ", changed = " ", added = " " }
                        local signs = vim.b[props.buf].gitsigns_status_dict
                        local labels = {}
                        if signs == nil then return labels end
                        for name, icon in pairs(icons) do
                            if tonumber(signs[name]) and signs[name] > 0 then
                                table.insert(labels, { icon .. signs[name] .. " ", group = "Diff" .. name })
                            end
                        end
                        if #labels > 0 then table.insert(labels, { "┊ " }) end
                        return labels
                    end

                    local function get_diagnostic_label()
                        local icons = { error = " ", warn = " ", info = " ", hint = " " }
                        local label = {}

                        for severity, icon in pairs(icons) do
                            local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
                            if n > 0 then table.insert(label, { icon .. n .. " ", group = "DiagnosticSign" .. severity }) end
                        end
                        if #label > 0 then table.insert(label, { "┊ " }) end
                        return label
                    end

                    return {
                        { get_diagnostic_label() },
                        { get_git_diff() },
                        { (ft_icon or "") .. " ", guifg = ft_color, guibg = "none" },
                        { filename .. " ", gui = vim.bo[props.buf].modified and "bold,italic" or "bold" },
                        -- { "┊  " .. vim.api.nvim_win_get_number(props.win), group = "DevIconWindows" },
                    }
                end,
            })
            -- require("incline").setup()
        end,
    },
}
