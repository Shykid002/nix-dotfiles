return {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		ensure_installed = {
			"python",
			"json",
			"lua",
			"bash",
			"vim",
			-- add more arguments for adding more treesitter parsers
		},
	},
}
