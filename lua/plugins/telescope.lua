return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
        },
        keys = {
            {
                "<leader>ff",
                function()
                    require("telescope.builtin").find_files()
                end,
                desc = "Find Files (Current git folder)",
            },
            {
                "<leader>fF",
                function()
                    require("telescope.builtin").find_files({ cwd = vim.fn.getcwd() })
                end,
                desc = "Find Files (Entry Folder)",
            },
            {
                "<leader><Space>",
                function()
                    require("telescope.builtin").find_files({ cwd = vim.fn.getcwd() })
                end,
                desc = "Find Files (Entry Folder)",
            },
            {
                "<leader>fP",
                function()
                    require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
                end,
                desc = "Find Plugin File",
            },
            {
                "<leader>fg",
                function()
                    require("telescope.builtin").live_grep()
                end,
                desc = "Grep (Current git folder)",
            },
            {
                "<leader>fG",
                function()
                    require("telescope.builtin").live_grep({ cwd = vim.fn.getcwd() })
                end,
                desc = "Grep (Entry Folder)",
            },
        },
        config = function(_, opts)
            local telescope = require("telescope")
            telescope.setup(opts)
            telescope.load_extension("fzf")
        end,
        opts = {
            defaults = {
                layout_strategy = "horizontal",
                layout_config = { prompt_position = "top" },
                sorting_strategy = "ascending",
                winblend = 0,
                mappings = {
                    i = {
                        ["<C-u>"] = false,
                        ["<C-d>"] = false,
                    },
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
            },
        },
    },
}
