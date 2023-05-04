return {
  "zbirenbaum/copilot.lua",
  dependencies = {
    { "zbirenbaum/copilot-cmp" },
  },
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<C-j>",
        },
      },
      server_opts_override = {
        trace = "verbose",
      },
      -- plugin_manager_path = vim.fn.expand("$HOME") .. '/.config/nvim/',
      copilot_node_command = vim.fn.expand("$HOME") .. "/.local/lib/n/n/versions/node/16.18.1/bin/node",
    })

    require("copilot_cmp").setup({
      method = "getCompletionsCycling",
    })
  end,
}
