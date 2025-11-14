return {
    cmd = { "fsautocomplete", "--adaptive-lsp-server-enabled" },
    root_dir = { "*.sln", "*.fsproj", ".git" },
    filetypes = { "fsharp" },
    init_options = {
        AutomaticWorkspaceInit = true,
    },
    -- this recommended settings values taken from  https://github.com/ionide/FsAutoComplete?tab=readme-ov-file#settings
    settings = {
        FSharp = {
            keywordsAutocomplete = true,
            ExternalAutocomplete = false,
            Linter = true,
            UnionCaseStubGeneration = true,
            UnionCaseStubGenerationBody = 'failwith "Not Implemented"',
            RecordStubGeneration = true,
            RecordStubGenerationBody = 'failwith "Not Implemented"',
            InterfaceStubGeneration = true,
            InterfaceStubGenerationObjectIdentifier = "this",
            InterfaceStubGenerationMethodBody = 'failwith "Not Implemented"',
            UnusedOpensAnalyzer = true,
            UnusedDeclarationsAnalyzer = true,
            UseSdkScripts = true,
            SimplifyNameAnalyzer = true,
            ResolveNamespaces = true,
            EnableReferenceCodeLens = true,
        },
    },
}
