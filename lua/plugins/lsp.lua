return {
    {
        "neovim/nvim-lspconfig",
        lazy = true,
        dependencies = "rafamadriz/friendly-snippets",
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

            -- vim.api.nvim_create_autocmd("LspAttach", {
            --     callback = function(event)
            --         local client = vim.lsp.get_client_by_id(event.data.client_id)
            --
            --         if client and client:supports_method("textDocument/completion") then
            --             local chars = {}
            --             for i = 32, 126 do
            --                 table.insert(chars, string.char(i))
            --             end
            --             client.server_capabilities.completionProvider.triggerCharacters = chars
            --             vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
            --         end
            --     end,
            -- })

            vim.lsp.set_log_level("error")
            local lsp_dir = vim.fn.stdpath("config") .. "/lsp"
            local fs_dir = vim.uv.fs_opendir(lsp_dir, nil, 100)
            if fs_dir then
                local files = vim.uv.fs_readdir(fs_dir)
                for _, file in pairs(files) do
                    vim.lsp.enable(file.name:match("(.+)%..+"))
                end
            end
        end,
    },
    {
        "williamboman/mason.nvim",
        event = "VeryLazy",
        opts = {},
        config = function(_, opts) require("mason").setup(opts) end,
    },
    {
        "pmizio/typescript-tools.nvim",
        ft = { "javascriptreact", "typescriptreact" },
        dependencies = {
            "neovim/nvim-lspconfig",
            "nvim-lua/plenary.nvim",
        },
        opts = {
            settings = {
                tsserver_file_preferences = {
                    includeInlayParameterNameHints = "all",
                    includeCompletionsForModuleExports = true,
                    quotePreference = "double",
                },
                tsserver_format_options = {
                    allowIncompleteCompletions = false,
                    allowRenameOfImportPath = true,
                    insertSpaceAfterCommaDelimiter = true,
                    insertSpaceAfterSemicolonInForStatements = true,
                    insertSpaceBeforeAndAfterBinaryOperators = true,
                    insertSpaceAfterConstructor = true,
                    insertSpaceAfterKeywordsInControlFlowStatements = true,
                    insertSpaceAfterFunctionKeywordForAnonymousFunctions = true,
                    insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = true,
                    insertSpaceAfterOpeningAndBeforeClosingNonemptyParenthesis = false,
                    insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets = false,
                    insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = true,
                    insertSpaceAfterOpeningAndBeforeClosingTemplateStringBraces = true,
                    insertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces = true,
                    insertSpaceAfterTypeAssertion = true,
                    insertSpaceBeforeFunctionParenthesis = false,
                    placeOpenBraceOnNewLineForFunctions = false,
                    placeOpenBraceOnNewLineForControlBlocks = false,
                    insertSpaceBeforeTypeAnnotation = false,
                    semicolons = "insert",
                },
                jsx_close_tag = {
                    enable = true,
                    filetypes = { "javascriptreact", "typescriptreact" },
                },
            },
        },
        config = function(_, opts)
            require("typescript-tools").setup(opts)
            vim.api.nvim_create_autocmd({ "BufWrite" }, {
                pattern = { "javascriptreact", "typescriptreact" },
                callback = function(data)
                    print(vim.inspect(data))
                    vim.cmd(":TSToolsOrganizeImports")
                    vim.cmd(":TSToolsAddMissingImports")
                    vim.cmd(":TSToolsFixAll")
                end,
            })
        end,
    },
}
