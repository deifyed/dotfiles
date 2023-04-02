require('telescope').setup({
    defaults = {
        file_ignore_patterns = { "node_modules", "target", "build" },
        mappings = {
            i = {
                ["<Tab>"] = require('telescope.actions').move_selection_next,
                ["<S-Tab>"] = require('telescope.actions').move_selection_previous,
            },
        },
    },
})

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-f>', builtin.find_files, {})
vim.keymap.set('n', '<C-g>', builtin.git_files, {})
vim.keymap.set('n', '<C-b>', builtin.buffers, {})
vim.keymap.set('n', '<C-s>', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
