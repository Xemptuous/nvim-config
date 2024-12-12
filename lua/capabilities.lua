local M = {}
M.capabilities = vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), {
    textDocument = {
        completion = {
            dynamicRegistration = false,
            completionItem = {
                snippetSupport = true,
                commitCharactersSupport = true,
                deprecatedSupport = true,
                preselectSupport = true,
                tagSupport = {
                    valueSet = {
                        1, -- Deprecated
                    },
                },
                insertReplaceSupport = true,
                resolveSupport = {
                    properties = {
                        "documentation",
                        "detail",
                        "additionalTextEdits",
                        "sortText",
                        "filterText",
                        "insertText",
                        "textEdit",
                        "insertTextFormat",
                        "insertTextMode",
                    },
                },
                insertTextModeSupport = {
                    valueSet = {
                        1, -- asIs
                        2, -- adjustIndentation
                    },
                },
                labelDetailsSupport = true,
            },
            contextSupport = true,
            insertTextMode = 1,
            completionList = {
                itemDefaults = {
                    "commitCharacters",
                    "editRange",
                    "insertTextFormat",
                    "insertTextMode",
                    "data",
                },
            },
        },
    },
})
return M
