vim.api.nvim_create_autocmd({"BufNewFile"}, {
  pattern = {"*.vue"},
  command = "0r ~/.config/nvim/lua/deifyed/templates/skeleton.vue",
})
