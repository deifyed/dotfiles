-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.mouse = ""
vim.opt.colorcolumn = "120"
vim.opt.textwidth = 120

vim.opt.laststatus = 3 -- Avante recommandation

-- Make LazyVim's "root dir" always mean cwd (the dir nvim was opened in),
-- instead of guessing per-buffer from LSP workspace / .git. Affects <leader>e,
-- <leader>ff, <leader><space>, <leader>/ etc.
vim.g.root_spec = { "cwd" }
