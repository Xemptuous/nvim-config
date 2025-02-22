return {
    cmd = {
        "clangd",
        "--enable-config",
        "--clang-tidy",
        "--background-index",
        "--offset-encoding=utf-8",
    },
    root_markers = {
        ".clangd",
        ".clang-tidy",
        ".clang-format",
        "compile_commands.json",
        "compile_flags.txt",
        "configure.ac", -- AutoTools
    },
    init_options = {
        fallbackFlags = { "-std=c++17" },
    },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    single_file_support = true,
}
