return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Ruff for linting and formatting
        ruff = {
          settings = {
            -- Ruff settings
          },
        },
        -- Pyright for type checking
        pyright = {
          settings = {
            python = {
              analysis = {
                -- Disable pyright diagnostics that Ruff handles
                ignore = { "*" },
                typeCheckingMode = "basic",
                -- Only use pyright for type information
                diagnosticSeverityOverrides = {
                  reportUnusedVariable = "none",
                  reportUnusedImport = "none",
                },
              },
            },
          },
        },
      },
      setup = {
        ruff = function()
          -- Set Ruff as the primary Python formatter
          require("lazyvim.util").lsp.on_attach(function(client, _)
            if client.name == "ruff" then
              -- Enable formatting with Ruff
              client.server_capabilities.documentFormattingProvider = true
            end
          end)
        end,
        pyright = function()
          require("lazyvim.util").lsp.on_attach(function(client, _)
            if client.name == "pyright" then
              -- Disable pyright formatting in favor of Ruff
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "ruff",
        "pyright",
      },
    },
  },
}