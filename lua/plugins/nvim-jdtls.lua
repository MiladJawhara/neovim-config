-- return {
--   "mfussenegger/nvim-jdtls",
--   config = function()
--     local home = os.getenv "HOME"
--
--     -- File types that signify a Java project's root directory. This will be
--     -- used by eclipse to determine what constitutes a workspace
--     local root_markers = { "gradlew", "mvnw", ".git" }
--     local root_dir = require("jdtls.setup").find_root(root_markers)
--
--     -- eclipse.jdt.ls stores project specific data within a folder. If you are working
--     -- with multiple different projects, each project must use a dedicated data directory.
--     -- This variable is used to configure eclipse to use the directory name of the
--     -- current project found using the root_marker as the folder for project specific data.
--     local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
--
--     return {
--       cmd = { vim.fn.expand "~/.local/share/nvim/mason/bin/jdtls", "-data", workspace_folder },
--       root_dir = workspace_folder,
--       classpath = {
--         workspace_folder .. ".classpath",
--       },
--       settings = {
--         java = {
--           signatureHelp = { enabled = true },
--           contentProvider = { preferred = "fernflower" }, -- Use fernflower to decompile library code
--         },
--       },
--     }
--   end,
-- }
return {
  "mfussenegger/nvim-jdtls",
  ft = { "java" },
  config = function()
    local home = os.getenv "HOME"
    local jdtls = require "jdtls"

    -- File types that signify a Java project's root directory. This will be
    -- used by eclipse to determine what constitutes a workspace
    local root_markers = { "gradlew", "mvnw", ".git" }
    local root_dir = require("jdtls.setup").find_root(root_markers)

    -- eclipse.jdt.ls stores project specific data within a folder. If you are working
    -- with multiple different projects, each project must use a dedicated data directory.
    -- This variable is used to configure eclipse to use the directory name of the
    -- current project found using the root_marker as the folder for project specific data.
    local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
    local lombok_path = vim.fn.expand "~/.local/share/nvim/mason/packages/jdtls/lombok.jar"

    local config = {
      cmd = {
        vim.fn.expand "~/.local/share/nvim/mason/packages/jdtls/jdtls",
        "-configuration",
        "~/.cache/jdtls/config",
        "-data",
        workspace_folder,
        "--jvm-arg=" .. string.format("-javaagent:%s", lombok_path),
        "--add-opens java.base/java.lang=ALL-UNNAMED",
      },

      -- 💀
      -- This is the default if not provided, you can remove it. Or adjust as needed.
      -- One dedicated LSP server & client will be started per unique root_dir
      root_dir = require("jdtls.setup").find_root { ".git", "mvnw", "gradlew", "pom.xml" },

      -- Here you can configure eclipse.jdt.ls specific settings
      -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
      -- for a list of options
      settings = {
        java = {
          maven = {
            downloadSources = true,
          },
          referencesCodeLens = {
            enabled = true,
          },
          references = {
            includeDecompiledSources = true,
          },
          inlayHints = {
            parameterNames = {
              enabled = "all", -- literals, all, none
            },
          },
          format = {
            enabled = false,
          },
          signatureHelp = { enabled = true },
          contentProvider = { preferred = "fernflower" }, -- Use fernflower to decompile library code
          sources = {
            organizeImports = {
              starThreshold = 9999,
              staticStarThreshold = 9999,
            },
          },
        },
      },

      -- Language server initializationOptions
      -- You need to extend the bundles with paths to jar files
      -- if you want to use additional eclipse.jdt.ls plugins.
      --
      -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
      --
      -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
      init_options = {
        bundles = {},
        classpath = workspace_folder .. "/.classpath",
      },
    }
    -- This starts a new client & server,
    -- or attaches to an existing client & server depending on the root_dir.
    require("jdtls").start_or_attach(config)
  end,
}
