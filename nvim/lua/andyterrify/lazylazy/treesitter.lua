-- vim: ts=2 sts=2 sw=2 et
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
	config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {"c", "lua", "vim", "vimdoc", "python", "rust",'markdown', 'markdown_inline'},

      auto_install = true,

      highlight = {
        enable = true,
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = 'gnn',
          node_incremental = 'grn',
          scope_incrementml = 'grc',
          node_decremental = 'grm',
        },
      },
    })
  end
}
