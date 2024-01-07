-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Install `lazy.nvim` plugin manager ]]
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- [[ Configure plugins ]]
-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require("kickstart.plugins")

-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
require("kickstart.settings")

-- [[ Basic Keymaps ]]

require("kickstart.keymaps")


-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- [[ Configure Telescope ]]
require("kickstart.plugins.telescope")

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require("kickstart.plugins.treesitter")

-- [[ Configure LSP ]]
require("kickstart.plugins.lsp")

-- [[ Configure nvim-cmp ]]
-- See `:help cmp`
require("kickstart.plugins.nvim-cmp")

-- -- [[ Configure Null LS ]]
require("kickstart.plugins.null-ls")

-- [[ Configure Indent-Blankline ]]
local highlight = {
  "RainbowRed",
  "RainbowYellow",
  "RainbowBlue",
  "RainbowOrange",
  "RainbowGreen",
  "RainbowViolet",
  "RainbowCyan",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
  vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
  vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
  vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
  vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
  vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
  vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

-- require("ibl").setup({
--   indent = { highlight = highlight },
--   scope = {
--     enabled = true,
--     show_start = true,
--     show_end = true
--   }
-- })

-- -- [[ Setup Oil ]]
-- -- https://github.com/stevearc/oil.nvim
--
-- require("oil").setup(
--   {
--     default_file_explorer = true,
--     columns = { "icon", "permissions", "size", "mtime" }
--   }
-- )
--
local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup({})
-- REQUIRED

vim.keymap.set("n", "<leader>t", function() harpoon:list():append() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

-- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
-- vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
-- vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
-- vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
--
local wilder = require('wilder')
wilder.setup({ modes = { ':', '/', '?' } })
wilder.set_option('pipeline', {
  wilder.branch(
    wilder.python_file_finder_pipeline({
      -- to use ripgrep : {'rg', '--files'}
      -- to use fd      : {'fd', '-tf'}
      file_command = { 'find', '.', '-type', 'f', '-printf', '%P\n' },
      -- to use fd      : {'fd', '-td'}
      dir_command = { 'find', '.', '-type', 'd', '-printf', '%P\n' },
      -- use {'cpsm_filter'} for performance, requires cpsm vim plugin
      -- found at https://github.com/nixprime/cpsm
      filters = { 'fuzzy_filter', 'difflib_sorter' },
    }),
    wilder.cmdline_pipeline(),
    wilder.python_search_pipeline()
  ),
})
wilder.set_option('renderer', wilder.popupmenu_renderer({
  -- highlighter applies highlighting to the candidates
  highlighter = wilder.basic_highlighter(),
}))

require("tokyonight").setup({
  stype = "night",
  transparent = true,
  terminal_colors = true,
  sidebars = { "qf", "help" },
  dim_inactive = false,
  lualine_bold = bold,
  on_highlights = function(hl, c)
    local prompt = "#2d3149"
    hl.TelescopeNormal = {
      bg = c.bg_dark,
      fg = c.fg_dark,
    }
    hl.TelescopeBorder = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
    hl.TelescopePromptNormal = {
      bg = prompt,
    }
    hl.TelescopePromptBorder = {
      bg = prompt,
      fg = prompt,
    }
    hl.TelescopePromptTitle = {
      bg = prompt,
      fg = prompt,
    }
    hl.TelescopePreviewTitle = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
    hl.TelescopeResultsTitle = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
  end,
})
vim.cmd.colorscheme 'tokyonight'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
