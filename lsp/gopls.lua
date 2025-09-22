return {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork" },
    root_markers = { { "go.mod", "go.sum", ".git" } },
    single_file_support = true,
    settings = {
        gopls = {
            staticcheck = true,
        },
    },
}
