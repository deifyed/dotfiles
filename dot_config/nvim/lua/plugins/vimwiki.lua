return {
  "vimwiki/vimwiki",
  init = function()
    vim.g.vimwiki_list = {
      {
        path = "~/wiki",
        syntax = "markdown",
        ext = ".md",
      },
    }
    vim.g.vimwiki_ext2syntax = {
      [".md"] = "markdown",
    }
  end,
}
