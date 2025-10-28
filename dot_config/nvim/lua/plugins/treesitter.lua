return {
  "nvim-treesitter/nvim-treesitter",
  config = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      opts.ensure_installed = LazyVim.dedup(opts.ensure_installed)
    end

    vim.treesitter.language.register("markdown", "vimwiki")
  end,
}
