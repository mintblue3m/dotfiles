return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "saghen/blink.cmp",
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {
                    library = {
                        -- See the configuration section for more details
                        -- Load luvit types when the `vim.uv` word is found
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },
        config = function()
            local capabilities = require("blink.cmp").get_lsp_capabilities()
            vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
            require("lspconfig").lua_ls.setup { capabilities = capabilities }
            require("lspconfig").rust_analyzer.setup { capabilities = capabilities }
            require("lspconfig").nushell.setup { capabilities = capabilities }
            require("lspconfig").csharp_ls.setup{ capabilities = capabilities }
            require("lspconfig").clangd.setup{ capabilities = capabilities }
        end,
    }
}
