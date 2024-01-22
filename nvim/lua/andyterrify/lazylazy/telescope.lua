-- vim: ts=2 sts=2 sw=2 et
return {
    "nvim-telescope/telescope.nvim",
    branch="0.1.x",
    dependencies={
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
      },
    },
    config = function()
      require("telescope").setup({
        extensions = {
          fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
          }
        },
        pickers = {
          buffers = {
            soft_lastused = true,
            sort_mru = true,
            ignore_current_buffer = true,
          }
        }
      })
      require('telescope').load_extension('fzf')

	    local builtin = require("telescope.builtin")
      -- searches only files tracked by git
      vim.keymap.set("n", "<C-p>", builtin.git_files, {})
      -- normal file search
      vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
      -- grep but with live preview
      vim.keymap.set("n", "<leader>ps", builtin.live_grep, {})
      -- searches nvim help tags
      vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
      -- searches all available commands that can be summoned by `:`
      vim.keymap.set("n", "<leader>vc", builtin.commands, {})
      -- searches old files
      vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
      -- fzf current buffer
      vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, {})
      -- search available buffers
      vim.keymap.set("n", "<leader><leader>b", builtin.buffers, {})

    end
  }

