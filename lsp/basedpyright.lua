return {
    cmd = { "basedpyright-langserver", "--stdio" },
    settings = {
        basedpyright = {
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                autoImportCompletions = true,
                typeCheckingMode = "standard", -- off, basic, standard, strict, recommended, all
                -- typeCheckingMode = "off", -- off, basic, standard, strict, recommended, all
                -- diagnosticMode = "openFilesOnly",
            },
        },
    },
    single_file_support = true,
}
