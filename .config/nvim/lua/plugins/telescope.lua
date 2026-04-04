-- lua/plugin/telescope.lua
return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local status_ok, telescope = pcall(require, "telescope")
    if not status_ok then
      vim.notify("Telescope not found!", vim.log.levels.ERROR)
      return
    end

    local builtin = require("telescope.builtin")

    telescope.setup({
      defaults = {
        prompt_prefix = "🔍 ",
        selection_caret = "➤ ",
        path_display = { "smart" },
      },
    })

    -- Keymaps
    vim.keymap.set("n", "<leader>ff", function()
      builtin.find_files({
        hidden = true, -- show hidden files
      })
    end, { desc = "Find Files (hidden)" })

    vim.keymap.set("n", "<leader>fg", function()
      builtin.live_grep({
        additional_args = function()
          return { "--hidden" } -- grep hidden files
        end,
      })
    end, { desc = "Live Grep (hidden)" })

    vim.keymap.set("n", "<leader>fb", builtin.buffers, {
      desc = "Buffers",
    })

    vim.keymap.set("n", "<leader>fh", builtin.help_tags, {
      desc = "Help Tags",
    })
  end,
}

