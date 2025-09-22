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
    -- Enhanced treesitter configuration for Python syntax highlighting only
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            -- Ensure Python parser is installed
            vim.list_extend(opts.ensure_installed, { "python" })

            -- Enable better highlighting
            opts.highlight = vim.tbl_extend("force", opts.highlight or {}, {
                enable = true,
                additional_vim_regex_highlighting = { "python" }, -- This can help with some edge cases
            })

            return opts
        end,
    },
    -- Custom highlight groups for Python to add more color variation
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            -- Define custom highlights for Python after colorscheme loads
            vim.api.nvim_create_autocmd("ColorScheme", {
                pattern = "*",
                callback = function()
                    -- Python-specific highlights for more colorful syntax
                    -- These link treesitter groups to different color groups
                    vim.api.nvim_set_hl(0, "@variable.python", { link = "Identifier" })
                    vim.api.nvim_set_hl(0, "@variable.builtin.python", { link = "Special" })
                    vim.api.nvim_set_hl(0, "@function.call.python", { link = "Function" })
                    vim.api.nvim_set_hl(0, "@function.builtin.python", { link = "Special" })
                    vim.api.nvim_set_hl(0, "@constructor.python", { link = "Type" })
                    vim.api.nvim_set_hl(0, "@constant.python", { link = "Constant" })
                    vim.api.nvim_set_hl(0, "@keyword.python", { link = "Keyword" })
                    vim.api.nvim_set_hl(0, "@keyword.function.python", { link = "Keyword" })
                    vim.api.nvim_set_hl(0, "@keyword.return.python", { link = "Keyword" })
                    vim.api.nvim_set_hl(0, "@keyword.operator.python", { link = "Operator" })
                    vim.api.nvim_set_hl(0, "@method.python", { link = "Function" })
                    vim.api.nvim_set_hl(0, "@method.call.python", { link = "Function" })
                    vim.api.nvim_set_hl(0, "@parameter.python", { link = "Parameter" })
                    vim.api.nvim_set_hl(0, "@property.python", { link = "Property" })
                    vim.api.nvim_set_hl(0, "@attribute.python", { link = "Property" })
                    vim.api.nvim_set_hl(0, "@type.python", { link = "Type" })
                    vim.api.nvim_set_hl(0, "@type.builtin.python", { link = "Type" })
                    vim.api.nvim_set_hl(0, "@string.documentation.python", { link = "SpecialComment" })
                end,
            })
        end,
    },
}

