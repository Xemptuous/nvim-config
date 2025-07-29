return {
    { "echasnovski/mini.ai", enabled = false, event = "VeryLazy", opts = {} },
    -- { "echasnovski/mini.basics", enabled = false, opts = {} },
    -- { "echasnovski/mini.bufremove", event = { "VeryLazy" }, opts = {} },
    { "echasnovski/mini.comment", keys = { "gc", "V" }, opts = {} },
    -- { "echasnovski/mini.cursorword", enabled = false, event = "VeryLazy", opts = {} },
    {
        "echasnovski/mini.completion",
        enabled = false,
        event = "VeryLazy",
        opts = {
            delay = {
                completion = 10,
                info = 50,
                signature = 50,
            },
            window = {
                info = {
                    height = 25,
                    width = 80,
                    border = "none",
                },
                signature = {
                    height = 25,
                    width = 80,
                    border = "none",
                },
            },
            lsp_completion = {
                source_func = "completefunc",
                -- source_func = "omnifunc",
                auto_setup = true,
            },
        },
    },
    {
        "echasnovski/mini.diff",
        -- key = { "<leader>go" },
        event = { "VeryLazy" },
        opts = {
            mappings = {
                apply = "",
                reset = "",
                textobject = "",
                goto_first = "[H",
                goto_prev = "[h",
                goto_next = "]h",
                goto_last = "]H",
            },
        },
        config = function(_, opts)
            require("mini.diff").setup(opts)
            vim.api.nvim_set_keymap("n", "<leader>go", ":lua MiniDiff.toggle_overlay()<CR>", { noremap = true, desc = "Toggle Overlay" })
        end,
    },
    {
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
    },
    { "echasnovski/mini.fuzzy", enabled = false, event = "VeryLazy", opts = {} },
    {
        "echasnovski/mini-git",
        enabled = false,
        event = "CmdlineEnter",
        config = function() require("mini.git").setup() end,
    },
    { "echasnovski/mini.icons", enabled = false, event = "VeryLazy", opts = {} },
    {
        "echasnovski/mini.indentscope",
        enabled = false,
        event = "VeryLazy",
        opts = {
            symbol = "▏",
            draw = {
                delay = 5,
                animation = function() return 0 end,
            },
            options = {
                try_as_border = true,
            },
        },
    },
    {
        "echasnovski/mini.notify",
        enabled = true,
        event = "VeryLazy",
        opts = {
            lsp_progress = {
                enable = true,
                duration_last = 100,
            },
            window = {
                config = {},
                winblend = 100,
            },
        },
    },
    { "echasnovski/mini.operators", enabled = false, event = "VeryLazy", opts = {} },
    { "echasnovski/mini.pairs", enabled = false, event = "VeryLazy", opts = {} },
    {
        "echasnovski/mini.pick",
        dependencies = "echasnovski/mini.extra",
        enabled = false,
        cmd = "Pick",
        keys = { "<leader>" },
        opts = {
            options = { use_cache = true },
            mappings = { choose_marked = "<C-q>" },
        },
        config = function(_, opts)
            require("mini.extra").setup(opts)
            local mp = require("mini.pick")
            mp.setup(opts)
            local map = vim.keymap.set
            -- stylua: ignore start
            map("n", "<leader>f", mp.builtin.files, { desc = "Pick Files" })
            map("n", "<leader>G", mp.builtin.grep_live, { desc = "Pick Grep Live" })
            map("n", "<leader>gg", mp.builtin.grep_live, { desc = "Pick Grep Live" })
            map("n", "<leader>h", mp.builtin.help, { desc = "Pick Help" })
            map("n", "<leader>b", mp.builtin.buffers, { desc = "Pick Buffers" })
            map("n", "<leader>gb", function() MiniExtra.pickers.git_branches({}, opts) end, { desc = "Pick Git Branches" })
            map("n", "<leader>o", function() MiniExtra.pickers.options({}, opts) end, { desc = "Pick LSP Definition" })
            map("n", "<leader>e", function() MiniExtra.pickers.explorer({}, opts) end, { desc = "Pick Explorer" })
            map("n", "<leader>d", function() MiniExtra.pickers.diagnostic({ scope = "current" }, opts) end, { desc = "Pick Diagnostic (Buffer)" })
            map("n", "<leader>D", function() MiniExtra.pickers.diagnostic({ scope = "all" }, opts) end, { desc = "Pick Diagnostic (All)" })
            map("n", "<leader>ld", function() MiniExtra.pickers.lsp({ scope = "definition" }, opts) end, { desc = "Pick LSP Definition" })
            map("n", "<leader>lD", function() MiniExtra.pickers.lsp({ scope = "declaration" }, opts) end, { desc = "Pick LSP Declaration" })
            map("n", "<leader>ls", function() MiniExtra.pickers.lsp({ scope = "document_symbol" }, opts) end, { desc = "Pick LSP Document Symbol" })
            map("n", "<leader>li", function() MiniExtra.pickers.lsp({ scope = "implementation" }, opts) end, { desc = "Pick LSP Implementation" })
            map("n", "<leader>lr", function() MiniExtra.pickers.lsp({ scope = "references" }, opts) end, { desc = "Pick LSP References" })
            map("n", "<leader>lt", function() MiniExtra.pickers.lsp({ scope = "type_definition" }, opts) end, { desc = "Pick LSP Type Definition" })
            map("n", "<leader>lS", function() MiniExtra.pickers.lsp({ scope = "workspace_symbol" }, opts) end, { desc = "Pick LSP Workspace Symbol" })
            -- stylua: ignore end
        end,
    },
    { "echasnovski/mini.splitjoin", keys = "gS", opts = {} },
    {
        "echasnovski/mini.statusline",
        enabled = true,
        event = { "VeryLazy" },
        version = false,
        config = function()
            local m = require("mini.statusline")
            local diag_signs = { ERROR = "!", WARN = "?", INFO = "@", HINT = "*" }
            local my_content = function()
                local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
                local git = MiniStatusline.section_git({ trunc_width = 40 })
                local diff = MiniStatusline.section_diff({ trunc_width = 75 })
                -- local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
                local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75, signs = diag_signs })
                -- local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
                local filename = MiniStatusline.section_filename({ trunc_width = 140 })
                -- local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
                local location = MiniStatusline.section_location({ trunc_width = 75 })
                local search = MiniStatusline.section_searchcount({ trunc_width = 75 })

                return MiniStatusline.combine_groups({
                    { hl = mode_hl, strings = { mode } },
                    { hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics, lsp } },
                    "%<", -- Mark general truncate point
                    { hl = "MiniStatuslineFilename", strings = { filename } },
                    "%=", -- End left alignment
                    { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
                    { hl = mode_hl, strings = { search, location } },
                })
            end
            m.setup({
                content = {
                    active = my_content,
                },
            })
        end,
    },
    {
        "echasnovski/mini.surround",
        event = "VeryLazy",
        opts = {},
    },
    {
        "echasnovski/mini.tabline",
        enabled = false,
        event = { "BufReadPre" },
        opts = {},
    },
}
