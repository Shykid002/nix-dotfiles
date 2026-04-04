return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		popup_border_style = "rounded",
		enable_git_status = true,
		source_selector = {
			winbar = false,
			statusline = false,
		},
		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
			},
		},
	},

	config = function(_, opts)
		-- Lazy already passes opts for you
		require("neo-tree").setup(opts)

		vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", {
			desc = "Toggle Neo-tree",
		})
	end,
}
