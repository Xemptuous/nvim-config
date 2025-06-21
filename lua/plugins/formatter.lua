local config_dir = vim.fn.stdpath("config"):match("(.*[/\\])")

return {
    {
        "stevearc/conform.nvim",
        event = { "VeryLazy" },
        init = function()
            -- Format on Save
            -- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
            -- 	pattern = { "*" },
            -- 	callback = function(args)
            -- 		require("conform").format({ bufnr = args.buf })
            -- 	end,
            -- })
            -- Manual Format
            vim.api.nvim_create_user_command("Format", function(args)
                local range = nil
                if args.count ~= -1 then
                    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
                    range = {
                        start = { args.line1, 0 },
                        ["end"] = { args.line2, end_line:len() },
                    }
                end
                require("conform").format({ async = true, lsp_format = "fallback", range = range })
            end, { range = true })
            -- Enable/Disable Formatting
            vim.api.nvim_create_user_command(
                "FormatDisable",
                function() vim.g.disable_autoformat = true end,
                { desc = "Disable autoformat-on-save" }
            )
            vim.api.nvim_create_user_command("FormatEnable", function()
                vim.b.disable_autoformat = false
                vim.g.disable_autoformat = false
            end, { desc = "Re-enable autoformat-on-save" })
            vim.api.nvim_set_keymap("n", "<\\>f", ":Format<cr>", {})
        end,
        opts = {
            log_level = vim.log.levels.DEBUG,
            -- notify_on_error = true,
            format_on_save = function(bufnr)
                if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then return end
                return { timeout_ms = 500, lsp_format = "fallback" }
            end,
            formatters_by_ft = {
                bash = { "beautysh" },
                c = { "clang_format" },
                cpp = { "clang_format" },
                cs = { "clang_format" },
                fish = { "fish_indent" },
                go = { "gofmt" },
                java = { "google-java-format" },
                -- java = { "clang_format" },
                js = { "prettier" },
                json = { "fixjson" },
                jsr = { "prettier" },
                jsx = { "prettier" },
                lisp = { "cljfmt" },
                lua = { "stylua" },
                mjs = { "prettier" },
                php = { "pretty-php" },
                python = { "isort", "black" },
                rust = { "rustfmt", lsp_format = "fallback" },
                sh = { "beautysh" },
                -- sql = { "sqlfluff" },
                svelte = { "prettier" },
                ts = { "prettier" },
                tsr = { "prettier" },
                tsx = { "prettier" },
                zsh = { "beautysh" },
            },
            formatters = {
                black = {
                    command = "black",
                    prepend_args = {
                        "--line-length",
                        80,
                        "-",
                    },
                },
                clang_format = {
                    command = "clang-format",
                    append_args = { "-style=file:" .. config_dir .. "clangd/.clang-format" },
                },
                odin = {
                    command = "odinfmt",
                    -- append_args = function()  return end,
                },
                -- sql = {
                --     command = "sqlfluff",
                --     stdin = true,
                --     append_args = function()
                --         return {
                --             "fix",
                --             "-",
                --         }
                --     end,
                -- },
                stylua = {
                    command = "stylua",
                    append_args = {
                        "--collapse-simple-statement",
                        "Always",
                        "--column-width",
                        "140",
                        "--indent-type",
                        "Spaces",
                        "--indent-width",
                        4,
                    },
                },
            },
        },
    },
}
