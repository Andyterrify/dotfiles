-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })

-- Faster exit
vim.keymap.set("i", "jk", "<Esc>", { desc = "Esc" })

-- Telescope quick open
vim.keymap.set('n', '<leader>fb', ":Telescope file_browser<CR>", { noremap = true, desc = "Open file browser" })
vim.keymap.set('n', '<leader>ft', ":NvimTreeToggle<CR>", { noremap = true, desc = "Open file tree" })

-- quicker buffers
vim.keymap.set('n', '<C-n>', ":bn<CR>", { noremap = true, desc = "Next Buffer" })
vim.keymap.set('n', '<C-b>', ":bp<CR>", { noremap = true, desc = "Previous Buffer" })

vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, desc = "Move to left window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, desc = "Move to up window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, desc = "Move to down window" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, desc = "Move to right window" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, desc = "Move down a page and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, desc = "Move up a page and center" })

vim.keymap.set('n', '<leader>sn', ":TodoTelescope<CR>", { noremap = true, desc = "[S]earch [N]otes" })
