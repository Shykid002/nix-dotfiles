return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  opts = function()
    return require("alpha.themes.theta").config
  end,
  config = function(_, opts)
    require("alpha").setup(opts)
  end,
}

