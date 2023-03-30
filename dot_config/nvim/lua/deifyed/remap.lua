vim.g.mapleader = " "
--
-- Open treeview
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move selected lines up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Disable something
vim.keymap.set("n", "Q", "<nop>")

-- Buffer handling
vim.keymap.set("n", "<leader>q", function()
    vim.api.nvim_buf_delete(0, {})
end)
vim.keymap.set("n", "<leader>w", function()
    local currentBuffer = vim.api.nvim_buf_get_name(0)

    for _, buffer in ipairs(vim.api.nvim_list_bufs()) do
        vim.api.nvim_buf_delete(buffer, {})
    end

    vim.api.nvim_command("edit " .. currentBuffer)
end)
