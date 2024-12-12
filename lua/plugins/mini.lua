return {
    { "echasnovski/mini.ai", enabled = false, event = "VeryLazy", opts = {} },
    { "echasnovski/mini.basics", enabled = false, opts = {} },
    { "echasnovski/mini.bufremove", event = { "BufReadPost" }, opts = {} },
    { "echasnovski/mini.comment", keys = { "gc", "V" }, opts = {} },
    { "echasnovski/mini.cursorword", enabled = false, event = "VeryLazy", opts = {} },
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
        -- event = "VeryLazy",
        event = { "BufReadPost" },
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
        event = "VeryLazy",
        keys = "<C-t>",
        -- dependencies = "echasnovski/mini.icons",
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
        event = "CmdlineEnter",
        config = function() require("mini.git").setup() end,
    },
    { "echasnovski/mini.icons", enabled = false, event = "VeryLazy", opts = {} },
    {
        "echasnovski/mini.indentscope",
        enabled = true,
        -- event = "VeryLazy",
        event = { "BufReadPost" },
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
        -- event = "VeryLazy",
        event = { "LspAttach" },
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
        enabled = false,
        event = "VeryLazy",
        cmd = "Pick",
        keys = { "<leader>" },
        opts = {
            options = { use_cache = true },
        },
        config = function(_, opts)
            local mp = require("mini.pick")
            mp.setup(opts)
            local builtin = mp.builtin
            local k = vim.keymap.set
            k("n", "<leader>f", builtin.files, { desc = "Grep Files" })
            k("n", "<leader>G", builtin.grep, { desc = "Grep" })
            k("n", "<leader>g", builtin.grep_live, { desc = "Grep Live" })
            k("n", "<leader>h", builtin.help, { desc = "Grep Help" })
            k("n", "<leader>b", builtin.buffers, { desc = "Grep Buffers" })
        end,
    },
    { "echasnovski/mini.splitjoin", keys = "gS", opts = {} },
    {
        "echasnovski/mini.statusline",
        -- event = "VeryLazy",
        event = { "BufReadPost" },
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
    { "echasnovski/mini.tabline", event = { "BufReadPost" }, opts = {} },
}
