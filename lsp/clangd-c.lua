return {
    cmd = {
        "clangd",
        "--enable-config",
        "--clang-tidy",
        "--background-index",
        "--offset-encoding=utf-8",
    },
    filetypes = { "c" },
    single_file_support = true,
}
