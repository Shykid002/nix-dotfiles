-- leader key (must be before mappings!)
vim.g.mapleader = " "

vim.keymap.set({ "n", "v" }, "<leader>fm", function()
	require("conform").format()
end, { desc = "Format file" })

vim.api.nvim_set_keymap("n", "<Tab>a", ":Alpha<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

vim.keymap.set("n", "<leader>w", function()
	require("which-key").show({ keys = "<c-w>", loop = true })
end, { desc = "Hydra mode for window commands" })

vim.keymap.set("n", "<leader>m", "<cmd>Mason<CR>", { desc = "Open Mason" })
