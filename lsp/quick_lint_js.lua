vim.lsp.config.quick_lint_js = {
    cmd = { "quick-lint-js", "--lsp-server" },
    filetypes = { "javascript", "javascriptreact", "jsx", "typescript" },
    root_markers = { "package.json" },
    single_file_support = true,
}
