return {
    cmd = {
        -- "dotnet",
        -- "/home/xempt/Downloads/omni/OmniSharp.dll",
        "OmniSharp",
        "-z",
        "--hostPID",
        tostring(vim.fn.getpid()),
        "DotNet:enablePackageRestore=false",
        "--encoding",
        "utf-8",
        "--languageserver",
    },
    root_markers = {
        "*.sln",
        "*.csproj",
        "omnisharp.json",
    },
    settings = {
        FormattingOptions = {
            EnableEditorConfigSupport = true,
            OrganizeImports = true,
        },
        MsBuild = {
            LoadProjectsOnDemand = true,
        },
        RoslynExtensionsOptions = {
            EnableAnalyzersSupport = true,
            EnableImportCompletion = true,
            AnalyzeOpenDocumentsOnly = true,
        },
        Sdk = {
            IncludePrereleases = true,
        },
    },
    filetypes = { "cs", "vb" },
    single_file_support = ralse,
}
