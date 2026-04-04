return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<c-t>]],
      size = 15,
      shade_terminals = true,
      direction = "vertical",
    })
  end,
}

