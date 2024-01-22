-- Set highlight on search
vim.o.hlsearch = true
vim.opt.incsearch = true

-- Make line numbers default
vim.wo.number = true

-- Convert line numbers to be relative to cursor
vim.opt.ruler = true
vim.opt.relativenumber = true

-- Display columns in buffer to indicate line length
vim.opt.colorcolumn = "80,120"

-- highlight the line the cursor is on
vim.opt.cursorline = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
-- vim.o.updatetime = 250
-- vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

vim.o.termguicolors = true

-- Disable wrap by default, preferred behavior
vim.o.wrap = false

-- better folding behavior
vim.o.foldmethod = 'indent'
vim.o.foldlevel = 10

-- how many lines to see when at the top or bottom of the buffer
vim.o.scrolloff = 8


vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- This will disable the vim swap and backup files and only use undotree,
-- saving undo files to ~/.local/state/nvim/undotree
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("state") .. "/undotree"

vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
