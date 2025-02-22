return {
    cmd = {
        "fsautocomplete",
        "--adaptive-lsp-server-enabled",
    },
    root_markers = {
        "*.sln",
        "*.fsproj",
    },
    init_options = {
        AutomaticWorkspaceInit = true,
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
        FSharp = {
            EnableReferenceCodeLens = true,
            ExternalAutocomplete = false,
            InterfaceStubGeneration = true,
            InterfaceStubGenerationMethodBody = 'failwith "Not Implemented"',
            InterfaceStubGenerationObjectIdentifier = "this",
            Linter = true,
            RecordStubGeneration = true,
            RecordStubGenerationBody = 'failwith "Not Implemented"',
            ResolveNamespaces = true,
            SimplifyNameAnalyzer = true,
            UnionCaseStubGeneration = true,
            UnionCaseStubGenerationBody = 'failwith "Not Implemented"',
            UnusedDeclarationsAnalyzer = true,
            UnusedOpensAnalyzer = true,
            UseSdkScripts = true,
            keywordsAutocomplete = true,
        },
    },
    filetypes = { "fsharp" },
    single_file_support = true,
}
