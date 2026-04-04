return {
    "windwp/nvim-autopairs", event = "InsertEnter", -- lazy load
    config = function()
        require("nvim-autopairs").setup({})
    end,
}
