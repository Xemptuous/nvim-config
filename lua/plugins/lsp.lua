return {
    {
        "neovim/nvim-lspconfig",
        lazy = true,
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
                    -- linehl = {
                    --     [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
                    --     [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
                    --     [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
                    --     [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
                    -- },
                    -- numhl = {
                    --     [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
                    --     [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
                    --     [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
                    --     [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
                    -- },
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

            vim.api.nvim_create_autocmd("LspAttach", {
                desc = "LSP actions",
                callback = function(event)
                    local opts = { buffer = event.buf }
                    local map = vim.keymap.set
                    map("n", "K", function() vim.lsp.buf.hover({ border = "single" }) end, opts)
                    -- map("n", "K", function() vim.lsp.buf.hover({ border = border }) end, opts)
                    map("n", "\\c", function()
                        local cur = vim.diagnostic.config().virtual_lines
                        if cur == nil or cur == false or cur == true then
                            vim.diagnostic.config({ virtual_lines = { current_line = true } })
                        else
                            vim.diagnostic.config({ virtual_lines = not vim.diagnostic.config().virtual_lines })
                        end
                    end, { desc = "Toggle Virtual Lines", buffer = event.buf })
                    map(
                        "n",
                        "\\v",
                        function() vim.diagnostic.config({ virtual_lines = not vim.diagnostic.config().virtual_lines }) end,
                        { desc = "Toggle Virtual Lines", buffer = event.buf }
                    )
                    map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "Goto Definition", buffer = event.buf })
                    map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", { desc = "Goto Declaration", buffer = event.buf })
                    map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", { desc = "Goto Implementation", buffer = event.buf })
                    map("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", { desc = "Goto Type Definition", buffer = event.buf })
                    map("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", { desc = "Goto References", buffer = event.buf })
                    map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
                    map("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "LSP Rename", buffer = event.buf })
                    map("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
                    map("x", "<F4>", "<cmd>lua vim.lsp.buf.range_code_action()<cr>", opts)
                    map(
                        "n",
                        "<leader>v",
                        "<cmd>lua vim.diagnostic.open_float()<cr>",
                        { desc = "Current Line Diagnostics", buffer = event.buf }
                    )
                    map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { desc = "Next Diagnostic", buffer = event.buf })
                    map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "Prev Diagnostic", buffer = event.buf })
                    map("n", "<leader>B", "<cmd>lua vim.diagnostic.setloclist()<cr>", { desc = "LSP LOC List", buffer = event.buf })
                    map("n", "<leader>W", "<cmd>lua vim.diagnostic.setqflist()<cr>", { desc = "LSP QF List", buffer = event.buf })
                end,
            })

            local lsps = {}
            local lsp_dir = vim.fn.stdpath("config") .. "/lsp"
            local fs_dir = vim.uv.fs_opendir(lsp_dir, nil, 100)

            if fs_dir then
                local files = vim.uv.fs_readdir(fs_dir)
                for _, file in pairs(files) do
                    table.insert(lsps, file.name:match("(.+)%..+"))
                end
            end

            for _, lsp in pairs(lsps) do
                -- for pmizio/typescript-tools.nvim
                if lsp ~= "ts_ls" then vim.lsp.enable(lsp) end
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
