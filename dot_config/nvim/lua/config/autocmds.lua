-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local debug = function(msg)
  if true then
    return
  end

  print(msg)
end

local bufIsEmpty = function(buffer_index)
  local content = vim.api.nvim_buf_get_lines(buffer_index, 0, -1, false)

  if content == nil then
    debug("content is nil")
    return true
  end

  if #content == 0 or (#content == 1 and content[1] == "") then
    debug("#content is 0 or..")

    return true
  end

  return false
end

-- Disable autoformat for lua files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "kotlin" },
  callback = function()
    vim.b.autoformat = false
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
  pattern = "*",
  callback = function()
    debug("checking template")

    if not bufIsEmpty(0) then
      debug("File is not empty")

      return
    end

    local template_dir = vim.fn.expand("%:p:h")
    local template_path = template_dir .. "/.neovim.template"

    if vim.fn.filereadable(template_path) ~= 1 then
      return
    end

    local file = io.open(template_path, "r")
    if not file then
      return
    end

    local file_content = file:read("*a")
    file:close()

    local filename = vim.fn.expand("%:t:r")

    local replacements = {
      ["{{title}}"] = filename:gsub("-", " "),
      ["{{filename}}"] = filename,
    }

    for placeholder, value in pairs(replacements) do
      file_content = file_content:gsub(placeholder, value)
    end

    vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(file_content, "\n"))
  end,
})
