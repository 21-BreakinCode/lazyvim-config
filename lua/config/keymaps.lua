-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>k0", "zM", { desc = "Close all folds" })
vim.keymap.set("n", "<leader>kj", "zR", { desc = "Open all folds" })
