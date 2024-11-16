return {
  lazy = false,
  "williamboman/mason.nvim",
  cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
  opts = function()
    return require "nvchad.configs.mason"
  end,
}
