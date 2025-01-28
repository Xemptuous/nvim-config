return {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_markers = {
        "pyproject.toml",
        "setup.py",
        "setup.cfg",
        "requirements.txt",
        "Pipfile",
        "pyrightconfig.json",
        ".git",
        "venv",
        ".venv",
    },
    settings = {
        python = {
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
