return {
    { 
        "nvim-treesitter/nvim-treesitter", branch = "master", lazy = false, build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = {
                    "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "nu", "xml", "c_sharp"
                },
                highlight = { enable = true },
                auto_install = false,
            }
        end
    }
}
