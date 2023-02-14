local dap = require("dap")
require ('mason-nvim-dap').setup({
  automatic_setup = true,
  ensure_installed = {'cpptools', 'debugpy'}
})
require 'mason-nvim-dap'.setup_handlers {
  function(source_name)
    require('mason-nvim-dap.automatic_setup')(source_name)
  end,
  python = function(source_name)
    dap.adapters.python = {
      type = 'executable',
      command = '/home/xempt/.virtualenvs/debugpy/bin/python3',
      -- command = '/usr/bin/python3',
      args = { '-m', 'debugpy.adapter' };
      -- args = { os.getenv("HOME") .. "/.virtualenvs/debugpy/bin/python" };
    }
    dap.configurations.python = {
      {
        type = 'python',
        request = 'launch',
        name = 'Launch file',
        program = '${file}'
      }
    }
  end
}

