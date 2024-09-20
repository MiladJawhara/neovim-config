return{
  {
    "rcarriga/nvim-dap-ui",
    event="VeryLazy",
    dependencies={
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config=function ()
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.before.attach.dapui_config = function()
          dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
          dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
          dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
          dapui.close()
      end
    end
  },
  {
    "nvim-neotest/nvim-nio",
    event="VeryLazy",
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event="VeryLazy",
    dependencies={
      "williamboman/mason.nvim",
      "fussenegger/nvim-dap",
    },
    opts={
      handlers={}
    }
  },
  {
  'mfussenegger/nvim-dap',
  config=function ()
  end
  }
}
