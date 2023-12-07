local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier.with({
      filetypes = {
        "javascript",
        "typescript",
        "css",
        "scss",
        "html",
        "yaml",
        "markdown",
        "graphql",
        "md",
        "txt",
      },
      only_local = "node_modules/.bin"
    }),
    -- null_ls.builtins.formatting.black.with({
    --   filetypes = { "python" },
    -- }),
  },
})
