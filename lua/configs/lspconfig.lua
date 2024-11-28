-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
-- EXAMPLE
local servers = {
  "html",
  "cssls",
  "prismals",
  "ts_ls",
  "intelephense",
  "lua_ls",
  "bashls",
  "clangd",
  "jdtls",
  "lemminx",
  "dockerls",
  "docker_compose_language_service",
  "tailwindcss",
  "yamlls",
  "nginx_language_server",
  "eslint",
}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
