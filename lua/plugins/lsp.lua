return {
    {
        "pmizio/typescript-tools.nvim",
        event = "VeryLazy",
        dependencies = {
            {
                "nvim-lua/plenary.nvim",
                event = "VeryLazy",
            },
            {
                "neovim/nvim-lspconfig",
                event = "VeryLazy",
            },
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
