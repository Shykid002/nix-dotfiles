-- List of all plugins
require("lazy").setup({
    {"nvim-telescope/telescope.nvim",dependencies = {"nvim-lua/plenary.nvim" },
    config = function()
        require("plugin.telescope")
        ---loads lua/plugin/telescope.lua
    end,
},
})
return {
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-mini/mini.icons' },
    config = require('plugins.alpha')  -- <- matches the file name
  },
}




