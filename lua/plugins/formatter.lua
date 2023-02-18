-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
local util = require "formatter.util"
require("formatter").setup {
  logging = true,
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    -- cpp = { require("formatter.filetypes.cpp").clangformat },
    json = { require("formatter.filetypes.json").jq },
    lua = { require("formatter.filetypes.lua").stylua, },
    python = { require("formatter.filetypes.python").autopep8 },
    sh = { require("formatter.filetypes.sh").shfmt },
    sql = { require("formatter.filetypes.sql").pgformat },
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}
