return {
    "echasnovski/mini.pick",
    dependencies = "echasnovski/mini.extra",
    enabled = false,
    cmd = "Pick",
    keys = { "<leader>" },
    opts = {
        options = { use_cache = true },
        mappings = { choose_marked = "<C-q>" },
    },
    config = function(_, opts)
        require("mini.extra").setup(opts)
        local mp = require("mini.pick")
        mp.setup(opts)
        local map = vim.keymap.set
            -- stylua: ignore start
            map("n", "<leader>f", mp.builtin.files, { desc = "Pick Files" })
            map("n", "<leader>G", mp.builtin.grep_live, { desc = "Pick Grep Live" })
            map("n", "<leader>s", mp.builtin.grep_live, { desc = "Pick Grep Live" })
            map("n", "<leader>h", mp.builtin.help, { desc = "Pick Help" })
            map("n", "<leader>b", mp.builtin.buffers, { desc = "Pick Buffers" })
            map("n", "<leader>pb", function() MiniExtra.pickers.git_branches({}, opts) end, { desc = "Pick Git Branches" })
            map("n", "<leader>o", function() MiniExtra.pickers.options({}, opts) end, { desc = "Pick LSP Definition" })
            map("n", "<leader>e", function() MiniExtra.pickers.explorer({}, opts) end, { desc = "Pick Explorer" })
            map("n", "<leader>d", function() MiniExtra.pickers.diagnostic({ scope = "current" }, opts) end, { desc = "Pick Diagnostic (Buffer)" })
            map("n", "<leader>D", function() MiniExtra.pickers.diagnostic({ scope = "all" }, opts) end, { desc = "Pick Diagnostic (All)" })
            map("n", "<leader>ld", function() MiniExtra.pickers.lsp({ scope = "definition" }, opts) end, { desc = "Pick LSP Definition" })
            map("n", "<leader>lD", function() MiniExtra.pickers.lsp({ scope = "declaration" }, opts) end, { desc = "Pick LSP Declaration" })
            map("n", "<leader>ls", function() MiniExtra.pickers.lsp({ scope = "document_symbol" }, opts) end, { desc = "Pick LSP Document Symbol" })
            map("n", "<leader>li", function() MiniExtra.pickers.lsp({ scope = "implementation" }, opts) end, { desc = "Pick LSP Implementation" })
            map("n", "<leader>lr", function() MiniExtra.pickers.lsp({ scope = "references" }, opts) end, { desc = "Pick LSP References" })
            map("n", "<leader>lt", function() MiniExtra.pickers.lsp({ scope = "type_definition" }, opts) end, { desc = "Pick LSP Type Definition" })
            map("n", "<leader>lS", function() MiniExtra.pickers.lsp({ scope = "workspace_symbol" }, opts) end, { desc = "Pick LSP Workspace Symbol" })
        -- stylua: ignore end
    end,
}
