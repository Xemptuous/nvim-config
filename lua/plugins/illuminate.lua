require('illuminate').configure({
  providers = {
      'lsp',
      'treesitter',
      'regex',
  },
  delay = 0,
  filetype_overrides = {},
  filetypes_denylist = {},
  filetypes_allowlist = {},
  modes_denylist = {},
  modes_allowlist = {},
  providers_regex_syntax_denylist = {},
  providers_regex_syntax_allowlist = {},
  under_cursor = false,
  large_file_cutoff = nil,
  large_file_overrides = nil,
  min_count_to_highlight = 2,
})

vim.cmd('highlight IlluminatedWordText gui=underline cterm=underline')
vim.cmd('highlight IlluminatedWordRead gui=underline cterm=underline')
