vim.lsp.config.cmake = {
    cmd = { "cmake-language-server" },
    filetypes = { "cmake" },
    root_markers = {
        "build",
        "src",
    },
    init_options = {
        buildDirectory = "build",
    },
    single_file_support = true,
}
