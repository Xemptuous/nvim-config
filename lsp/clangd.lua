return {
    cmd = {
        "clangd",
        "--enable-config",
        "--clang-tidy",
        "--background-index",
        "--offset-encoding=utf-8",
    },
    init_options = {
        fallbackFlags = { "-std=c++17" },
    },
    single_file_support = true,
}
