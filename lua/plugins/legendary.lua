require('legendary').setup({
  keymaps = {
    -- {
    --   itemgroup = 'Telescope',
    --   description = 'Telescope related stuff',
    --   keymaps = {
        {'<leader>tf', ':Telescope find_files<CR>', description = 'Telescope Find File' },
        {'<leader>tg', ':Telescope live_grep<CR>', description = 'Telescope Grep' },
        {'<leader>tb', ':Telescope buffers<CR>', description = 'Telescope Buffers' },
        {'<leader>th', ':Telescope help_tags<CR>', description = 'Telescope Help' },
        {'<leader>tR', ':Telescope oldfiles<CR>', description = 'Telescope Open Recent File' },
        {'<leader>tw', ':Telescope grep_string{}<CR>', description = 'Telescope String' },
        {'<leader>tH', ':Telescope search_history{}<CR>', description = 'Telescope Search History' },
        {'<leader>tC', ':Telescope command_history{}<CR>', description = 'Telescope Command History' },
        {'<leader>tc', ':Telescope colorscheme{}<CR>', description = 'Telescope Colorscheme' },
        {'<leader>tr', ':Telescope registers{}<CR>', description = 'Telescope Registers' },
    --   }
    -- },
    -- {
    --   itemgroup = 'Debugger',
    --   description = 'DAP related stuff',
    --   keymaps = {
        {'<F5>', "DapContinue<CR>", description = "Debugger Continue" },
        {'<F6>', "DapStepOver<CR>", description = "Debugger StepOver" },
        {'<F7>', "DapStepInto<CR>", description = "Debugger StepInto" },
        {'<F8>', "DapStepOut<CR>", description = "Debugger StepOut" },
        {'<leader>db', "DapToggleBreakpoint<CR>", description = "Debugger Breakpoint Toggle" },
        {'<leader>dr', "DapToggleReplCR>", description = "Debugger REPL Toggle" },
        {'<leader>dl', ":lua require('dap').run_last()<CR>", description = "Debugger Run Last" },
        {'<leader>dh', ":lua require('dap.ui.widgets').hover()<CR>", description = "Debugger Show Hover Info" },
        {'<leader>dp', ":lua require('dap.ui.widgets').preview()<CR>", description = "Debugger Show Preview" },
        {'<leader>df', ":lua widgets.centered_float(require('dap.ui.widgets').frames)<CR>", description = "Debugger Show Frames" },
        {'<leader>ds', ":lua widgets.centered_float(require('dap.ui.widgets').scopes)<CR>", description = "Debugger Show Scopes" },
    --   }
    -- },
  }
})
vim.keymap.set('n', '<C-f>', ':Legendary<CR>')
