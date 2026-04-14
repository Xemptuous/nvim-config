return {
    cmd = {
        "clangd",
        "--enable-config",
        "--clang-tidy",
        "--background-index",
        "--offset-encoding=utf-8",
    },
    filetypes = { "c", "cpp" },
    init_options = {
        fallbackFlags = { "-std=c++20" },
    },
    single_file_support = true,
}
