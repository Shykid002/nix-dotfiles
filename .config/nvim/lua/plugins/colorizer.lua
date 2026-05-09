{
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({
      -- List all filetypes you want to highlight
      "*", 
      -- Add "conf" and "nix" specifically just in case
      "conf", "nix", "hyprlang" 
    }, {
      RGB      = true,
      RRGGBB   = true,
      RRGGBBAA = true, -- Matches the 'ff' at the end of your hex
      rgb_fn   = true, -- Matches the 'rgba' prefix
      hsl_fn   = true,
      css      = true,
      mode     = 'background',
    })
    
    -- Force colorizer to attach to the current buffer immediately
    vim.cmd("ColorizerReloadAllBuffers")
  end
}

