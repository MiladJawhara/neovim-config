return {
  "nvim-tree/nvim-tree.lua",
  opts = function()
    local conf = require "nvchad.configs.nvimtree";

    conf['git']={
      enable = true,
      ignore = false,
    }
    -- conf.defaults.opts.git.enable = true
    -- conf.defaults.opts.git.ignore = false

    return conf
  end,
}
