return {
    cmd = { "vscode-json-language-server", "--stdio" },
    filetypes = { "json", "json5", "jsonc" },
    init_options = {
        provideFormatter = true,
    },
    single_file_support = true,
}
