return {
	"RRethy/base16-nvim", -- Note: ensure the name matches the repo exactly
	lazy = false, -- Load immediately since it's a colorscheme
	priority = 1000, -- Ensure it loads before other plugins
	config = function()
		vim.cmd("colorscheme base16-tomorrow-night") -- Replace with your preferred theme
	end,
}
