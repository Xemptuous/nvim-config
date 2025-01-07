vim.opt.signcolumn = "yes"
-- local border = { " ", "", "", "", "", "", " ", " " }
local border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" }

vim.diagnostic.config({
    virtual_text = false,
    underline = false,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
            [vim.diagnostic.severity.INFO] = " ",
        },
        num_hl = {
            [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
            [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
            [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
            [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
        },
    },
    -- signs = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = border,
        source = "always",
        header = "",
        prefix = "",
    },
})

local handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" } }),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
    ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        underline = true,
        signs = true,
        update_in_insert = false,
    }),
}
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or border
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
--     virtual_text = false,
--     underline = true,
--     signs = true,
--     update_in_insert = false,
-- })

vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP actions",
    callback = function(event)
        local opts = { buffer = event.buf }
        local map = vim.keymap.set
        map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
        map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "Goto Definition", buffer = event.buf })
        map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", { desc = "Goto Declaration", buffer = event.buf })
        map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", { desc = "Goto Implementation", buffer = event.buf })
        map("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", { desc = "Goto Type Definition", buffer = event.buf })
        map("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", { desc = "Goto References", buffer = event.buf })
        map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
        map("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "LSP Rename", buffer = event.buf })
        map("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
        map("x", "<F4>", "<cmd>lua vim.lsp.buf.range_code_action()<cr>", opts)
        map("n", "<leader>v", "<cmd>lua vim.diagnostic.open_float()<cr>", { desc = "Current Line Diagnostics", buffer = event.buf })
        map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { desc = "Next Diagnostic", buffer = event.buf })
        map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "Prev Diagnostic", buffer = event.buf })
        map("n", "<leader>B", "<cmd>lua vim.diagnostic.setloclist()<cr>", { desc = "LSP LOC List", buffer = event.buf })
        map("n", "<leader>W", "<cmd>lua vim.diagnostic.setqflist()<cr>", { desc = "LSP QF List", buffer = event.buf })
    end,
})
vim.lsp.config("*", {
    root_markers = { ".git" },
})

local lsps = {
    "bashls",
    "clangd",
    -- "cmake",
    "cssls",
    "html",
    "gopls",
    "luals",
    "basedpyright",
    -- "pyright",
    "quick_lint_js",
    "rust_analyzer",
    "phpactor",
    "jsonls",
    "ts_ls",
    "zls",
}

for _, lsp in pairs(lsps) do
    vim.lsp.config[lsp].capabilities = require("capabilities").capabilities
end

vim.lsp.enable(lsps)
