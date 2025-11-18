return {
    {
        "nvim-telescope/telescope.nvim",
        enabled = true,
        cmd = "Telescope",
        keys = "<leader>",
        dependencies = {
            "nvim-lua/plenary.nvim",
            -- "ghassan0/telescope-glyph.nvim",
            "nvim-telescope/telescope-symbols.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                -- build = "make",
                build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
                config = function() require("telescope").load_extension("fzf") end,
            },
        },
        opts = {
            extensions = {
                -- glyph = {
                --     action = function(glyph)
                --         vim.fn.setreg("*", glyph.value)
                --         vim.api.nvim_put({ glyph.value }, "c", false, true)
                --     end,
                -- },
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
                aerial = {
                    col1_width = 4,
                    col2_width = 30,
                    format_symbol = function(symbol_path, filetype)
                        if filetype == "json" or filetype == "yaml" then
                            return table.concat(symbol_path, ".")
                        else
                            return symbol_path[#symbol_path]
                        end
                    end,
                    -- Available modes: symbols, lines, both
                    show_columns = "both",
                },
            },
            pickers = {
                buffers = { theme = "ivy" },
                colorscheme = { theme = "ivy" },
                commands = { theme = "ivy" },
                find_files = { theme = "ivy" },
                grep_string = { theme = "ivy" },
                help_tags = { theme = "ivy" },
                keymaps = { theme = "ivy" },
                live_grep = { theme = "ivy" },
                man_pages = { theme = "ivy" },
                marks = { theme = "ivy" },
                oldfiles = { theme = "ivy" },
                registers = { theme = "ivy" },
                search_history = { theme = "ivy" },
                vim_options = { theme = "ivy" },

                git_branches = { theme = "ivy" },
                diagnostics = { theme = "ivy" },
                lsp_definitions = { theme = "ivy" },
                lsp_document_symbols = { theme = "ivy" },
                lsp_implementations = { theme = "ivy" },
                lsp_references = { theme = "ivy" },
                lsp_type_definitions = { theme = "ivy" },
                lsp_workspace_symbols = { theme = "ivy" },
            },
        },
        config = function(_, opts)
            require("telescope").setup(opts)
            require("telescope").load_extension("aerial")
            local k = vim.keymap.set
            local builtin = require("telescope.builtin")
            -- stylua: ignore start
            k("n", "<leader>ta", "<cmd>Telescope aerial<cr>", { desc = "Vim Options" })
            k("n", "<leader>to", builtin.vim_options, { desc = "Vim Options" })
            k("n", "<leader>tf", builtin.find_files, { desc = "Find File" })
            k("n", "<leader>f", builtin.find_files, { desc = "Find File" })
            k("n", "<leader>tg", builtin.live_grep, { desc = "Grep" })
            k("n", "<leader>s", builtin.live_grep, { desc = "Grep" })
            k("n", "<leader>G", builtin.live_grep, { desc = "Grep" })
            k("n", "<leader>tb", builtin.buffers, { desc = "Buffers" })
            k("n", "<leader>b", builtin.buffers, { desc = "Buffers" })
            k("n", "<leader>th", builtin.help_tags, { desc = "Help" })
            k("n", "<leader>h", builtin.help_tags, { desc = "Help" })
            k("n", "<leader>tm", builtin.man_pages, { desc = "Man Pages" })
            k("n", "<leader>tk", builtin.keymaps, { desc = "Keymaps" })
            k("n", "<leader>k", builtin.keymaps, { desc = "Keymaps" })
            k("n", "<leader>tR", builtin.oldfiles, { desc = "Old Files" })
            k("n", "<leader>tw", builtin.grep_string, { desc = "Grep String" })
            k("n", "<leader>w", builtin.grep_string, { desc = "Grep String" })
            k("n", "<leader>tH", builtin.search_history, { desc = "Search History" })
            k("n", "<leader>tc", builtin.colorscheme, { desc = "Colorscheme" })
            k("n", "<leader>tC", builtin.commands, { desc = "Commands" })
            k("n", "<leader>tr", builtin.registers, { desc = "Registers" })
            k("n", "<leader>tM", builtin.marks, { desc = "Marks" })
            k("n", "<leader>tn", "<cmd>Telescope nerdy<cr>", { desc = "Nerd Icons" })
            -- k("n", "<leader>gb", builtin.git_branches, { desc = "Pick Git Branches" })
            k("n", "<leader>d", function() builtin.diagnostics({bufnr=0}) end, { desc = "Pick Diagnostic (Buffer)" })
            k("n", "<leader>d", builtin.diagnostics, { desc = "Pick Diagnostic (All)" })
            k("n", "<leader>ld", builtin.lsp_definitions, { desc = "Pick LSP Definition" })
            k("n", "<leader>ls", builtin.lsp_document_symbols, { desc = "Pick LSP Document Symbol" })
            k("n", "<leader>li", builtin.lsp_implementations, { desc = "Pick LSP Implementation" })
            k("n", "<leader>lr", builtin.lsp_references, { desc = "Pick LSP References" })
            k("n", "<leader>lt", function() builtin.lsp_type_definitions({}) end, { desc = "Pick LSP Type Definition" })
            k("n", "<leader>lS", builtin.lsp_workspace_symbols, { desc = "Pick LSP Workspace Symbol" })
            -- stylua: ignore end
        end,
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        enabled = false,
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },
}
