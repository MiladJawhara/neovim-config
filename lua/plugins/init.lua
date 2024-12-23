return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "javascript",
        "typescript",
        "php",
        "prisma",
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "bash",
        "cpp",
        "java",
        "xml",
        "tsx",
        "json",
        "scss",
        "yaml",
        "dockerfile",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<leader>ss",
          node_incremental = "<leader>s+",
          scope_incremental = "<leader>sc",
          node_decremental = "<leader>s-",
        },
      },
    },
  },
}
