return{
  "nvim-telescope/telescope.nvim",
  keys={
    {"<leader>fg",require("telescope.builtin").git_files,{}}
  },
  opts = function()
    local conf = require "nvchad.configs.telescope"

    conf.defaults.mappings.i = {
      ["<C-j>"] = require("telescope.actions").move_selection_next,
      ["<Esc>"] = require("telescope.actions").close,
    }

    -- or 
    -- table.insert(conf.defaults.mappings.i, your table)

    return conf
  end,
}
