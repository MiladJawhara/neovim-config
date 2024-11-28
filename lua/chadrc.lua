-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@class ChadrcConfig
local M = {}

M.mason = {
  pkgs = {
    "lua-language-server",
    "stylua",
    "html-lsp",
    "css-lsp",
    "prettier",
    "intelephense",
    "jdtls",
    "lemminx",
    "clang-format",
    "clangd",
    "dockerfile-language-server",
    "docker-compose-language-service",
    "yaml-language-server",
    "nginx-language-server",
    "bash-language-server",
    "typescript-language-server",
    "tailwindcss-language-server",
    "eslint-lsp",
  },
}

M.base46 = {
  theme = "onedark",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.nvdash = {
  load_on_startup = true,
}

return M
