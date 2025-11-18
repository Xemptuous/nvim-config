return {
    "lewis6991/gitsigns.nvim",
    -- enabled = false,
    event = "VeryLazy",
    opts = {
        signcolumn = false, -- Toggle with `:Gitsigns toggle_signs`
        numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
        linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
        on_attach = function(bufnr)
            local gitsigns = require("gitsigns")

            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            -- Navigation
            map("n", "]g", function()
                if vim.wo.diff then
                    vim.cmd.normal({ "]c", bang = true })
                else
                    gitsigns.nav_hunk("next")
                end
            end, { desc = "Next" })

            map("n", "[g", function()
                if vim.wo.diff then
                    vim.cmd.normal({ "[c", bang = true })
                else
                    gitsigns.nav_hunk("prev")
                end
            end, { desc = "Previous" })

                -- Actions
                -- stylua: ignore start
                map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "Stage Hunk" })
                map("v", "<leader>gs", function() gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { desc = "Stage Hunk" })
                map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Reset Hunk" })
                map("v", "<leader>gr", function() gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { desc = "Reset Hunk" })
                map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "Stage Buffer" })
                map("n", "<leader>gu", gitsigns.undo_stage_hunk, { desc = "Undo Stage Hunk" })
                map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "Reset Buffer" })
                map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Preview Hunk" })
                map("n", "<leader>gb", gitsigns.toggle_current_line_blame, { desc = "Toggle Current Line Blame" })
                map("n", "<leader>gB", function() gitsigns.blame_line({ full = true }) end, { desc = "Blame Line" })
                map("n", "<leader>gd", gitsigns.diffthis, { desc = "Diff This" })
                map("n", "<leader>gq", gitsigns.setqflist, { desc = "Set Quickfix List" })
                map("n", "<leader>gl", gitsigns.setloclist, { desc = "Set Location List" })
                map("n", "<leader>gD", function() gitsigns.diffthis("~") end, { desc = "Diff This HEAD~" })
                map("n", "\\gd", gitsigns.toggle_deleted, { desc = "Toggle Deleted" })
                map("n", "\\gs", "<cmd>:Gitsigns toggle_signs<cr>", { desc = "Toggle Signs" })
                map("n", "\\gn", "<cmd>:Gitsigns toggle_numhl<cr><cmd>:lua MiniDiff.toggle()<cr>", { desc = "Toggle Number Highlight" })
                map("n", "\\gl", "<cmd>:Gitsigns toggle_linehl<cr>", { desc = "Toggle Line Highlight" })
                map("n", "\\gw", "<cmd>:Gitsigns toggle_word_diff<cr>", { desc = "Toggle Word Diff" })
                map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select Hunk" })
            -- stylua: ignore end
        end,
    },
}
