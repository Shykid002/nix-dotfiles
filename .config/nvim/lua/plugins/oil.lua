return { -- Edit filesystem like a vim buffer
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = "Oil",
	keys = {
		{
			"-",
			function()
				require("oil").open()
			end,
			desc = "Open parent directory",
		},
	},
	config = function()
		require("oil").setup({
			keymaps = {
				["<CR>"] = "actions.select", --open file
				["<Right>"] = "actions.select", --open file
				["<Left>"] = "actions.parent", --go to parent directory
				["-"] = "actions.parent", --go to directory
				["q"] = "actions.close", --quit/close
				["h"] = "actions.toggle_hidden", --show hidden
			},
		})
	end,
}
