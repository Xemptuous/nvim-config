vim.lsp.config.clangd = {
    cmd = {
        "clangd",
        "--clang-tidy",
        "--background-index",
        "--offset-encoding=utf-8",
    },
    root_markers = { ".clangd", "compile_commands.json" },
    filetypes = { "c", "cpp", "cs", "java", "objc", "objcpp", "cuda", "proto" },
    single_file_support = true,
}
