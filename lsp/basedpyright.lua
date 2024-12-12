vim.lsp.config.basedpyright = {
    cmd = { "basedpyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_markers = {
        "pyproject.toml",
        "setup.py",
        "setup.cfg",
        "requirements.txt",
        "Pipfile",
        "pyrightconfig.json",
        ".git",
    },
    settings = {
        basedpyright = {
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                autoImportCompletions = true,
                typeCheckingMode = "off", -- off, basic, standard, strict, recommended, all
                diagnosticMode = "openFilesOnly",
            },
        },
    },
    single_file_support = true,
}
