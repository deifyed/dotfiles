return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_snipmate").lazy_load()
        require("luasnip.loaders.from_snipmate").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
      end,
    },
  },
}
