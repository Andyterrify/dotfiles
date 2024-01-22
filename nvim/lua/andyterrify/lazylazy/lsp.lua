return {

    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "FelipeLema/cmp-async-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
        "folke/neodev.nvim",
        "nvimtools/none-ls.nvim",
        "onsails/lspkind.nvim",
    },
    config = function()
        require("fidget").setup({})

        require('neodev').setup()

        local cmp = require("cmp")
        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        local lspkind = require("lspkind")
        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ silent = true }),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['Tab'] = nil,
                ['S-Tab'] = nil,
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" }, -- For luasnip users.
            }, {
                { name = "buffer" },
                { name = "async_path" },
            }),
            formatting = {
                format = lspkind.cmp_format({
                    mode = 'symbol', -- show only symbol annotations
                    maxwidth = 80,   -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                    -- can also be a function to dynamically calculate max width such as
                    -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
                    ellipsis_char = '...',    -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                    show_labelDetails = true, -- show labelDetails in menu. Disabled by default
                })
            }
        })

        -- `/` cmdline setup.
        cmp.setup.cmdline('/', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        -- `:` cmdline setup.
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                {
                    name = 'cmdline',
                    option = {
                        ignore_cmds = { 'Man', '!' }
                    }
                }
            })
        })

        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        require("mason").setup({})

        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "rust_analyzer" },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,
                -- Configure `ruff-lsp`.
                -- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ruff_lsp
                -- For the default config, along with instructions on how to customize the settings
                ["ruff_lsp"] = function()
                    require('lspconfig').ruff_lsp.setup {
                        init_options = {
                            settings = {
                                -- Any extra CLI arguments for `ruff` go here.
                                lint = { args = { "quote-style=single" } },
                                format = { args = { "quote-style=single", "inline-quotes=single" } }
                            }
                        }
                    }
                end
            }
        })

        vim.diagnostic.config({ virtual_text = true })
        -- -- [[ Configure rust-tools ]]
        -- local rt = require("rust-tools")
        -- rt.setup({
        --     server = {
        --         on_attach = function(_, bufnr)
        --             on_attach(_, bufnr) -- This calls the global on_attach
        --             -- Hhver Actions
        --             vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
        --             vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
        --         end,
        --     }
        -- })
    end
}

-- Nice Rust tools
-- "simrat39/rust-tools.nvim",
