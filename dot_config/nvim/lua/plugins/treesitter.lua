return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    vim.treesitter.language.register("markdown", "vimwiki")
  end,
}
