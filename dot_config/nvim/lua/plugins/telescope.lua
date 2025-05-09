return {
  "nvim-telescope/telescope.nvim",
  config = function()
    require("telescope").setup({
      defaults = {
        path_display = { filename_first = 5 },
        file_ignore_patterns = { "node_modules", "target", "dist", "build" },
        mappings = {
          i = {
            ["<Tab>"] = require("telescope.actions").move_selection_next,
            ["<S-Tab>"] = require("telescope.actions").move_selection_previous,
          },
        },
      },
    })
  end,
}
