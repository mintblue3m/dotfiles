vim.o.autoread = true
vim.o.undofile = true
vim.o.relativenumber = true
vim.o.number = true

-- indent, tabs
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.autoindent = true
vim.o.expandtab = true

-- misc
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = "no"
vim.o.incsearch = true
vim.o.updatetime = 300
vim.o.winborder = "rounded"
vim.o.cursorcolumn = false
vim.o.signcolumn = "yes"

-- windows
vim.o.splitbelow = true
vim.o.splitright = true

vim.g.mapleader = " "

vim.pack.add({
    {src = "https://github.com/zenbones-theme/zenbones.nvim"},
    {src = "https://github.com/rktjmp/lush.nvim"},
    {src = "https://github.com/echasnovski/mini.nvim"},
    {src = "https://github.com/neovim/nvim-lspconfig"},
    {src = "https://github.com/rafamadriz/friendly-snippets"},
    {src = "https://github.com/Saghen/blink.cmp"},
    {src = "https://github.com/mikesmithgh/kitty-scrollback.nvim"}
})
vim.cmd.colorscheme("tokyobones")
vim.cmd(":hi statusline guibg=NONE")

require("mini.starter").setup()
require("mini.icons").setup()
require("mini.statusline").setup()
require("mini.pairs").setup()
require("mini.move").setup()
require("mini.surround").setup()
require("mini.pick").setup()
require("mini.files").setup()

vim.keymap.set("n", "<leader>ff", ":Pick files<CR>")
vim.keymap.set("n", "<leader>fm", ":lua MiniFiles.open()<CR>")
vim.keymap.set("n", "<leader>c", ":lua MiniPick.start({ source = { items = vim.fn.readdir('/home/krabs/.config/nvimNew') } })<CR>")

vim.lsp.config('lua_ls', {on_init = function(client)
if client.workspace_folders then
    local path = client.workspace_folders[1].name
    if
        path ~= vim.fn.stdpath('config')
        and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
        then
            return
        end
    end
client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
        runtime = {
            -- Tell the language server which version of Lua you're using (most
            -- likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
            -- Tell the language server how to find Lua modules same way as Neovim
            -- (see `:h lua-module-load`)
            path = {
                'lua/?.lua',
                'lua/?/init.lua',
            },
        },
        -- Make the server aware of Neovim runtime files
        workspace = {
            checkThirdParty = false,
            library = {
                vim.env.VIMRUNTIME
                -- Depending on the usage, you might want to add additional paths
                -- here.
                -- '${3rd}/luv/library'
                -- '${3rd}/busted/library'
            }
            -- Or pull in all of 'runtimepath'.
            -- NOTE: this is a lot slower and will cause issues when working on
            -- your own configuration.
            -- See https://github.com/neovim/nvim-lspconfig/issues/3189
            -- library = {
                --   vim.api.nvim_get_runtime_file('', true),
                -- }
            }
        })
    end,
    capabilities = require("blink.cmp").get_lsp_capabilities(),
    settings = {
        Lua = {}
    }
})

vim.lsp.config("clangd", {
    capabilities =
  {
    offsetEncoding = { "utf-8", "utf-16" },
    textDocument = {
      completion = {
        editsNearCursor = true
      }
    }
  },
  require("blink.cmp").get_lsp_capabilities()
})

vim.lsp.enable({"lua_ls", "clangd"})
require("blink.cmp").setup({
  -- Disable cmdline
  cmdline = { enabled = false },

  completion = {
    -- 'prefix' will fuzzy match on the text before the cursor
    -- 'full' will fuzzy match on the text before _and_ after the cursor
    -- example: 'foo_|_bar' will match 'foo_' for 'prefix' and 'foo__bar' for 'full'
    keyword = { range = 'full' },

    -- Disable auto brackets
    -- NOTE: some LSPs may add auto brackets themselves anyway
    accept = { auto_brackets = { enabled = false }, },

    -- Don't select by default, auto insert on selection
    list = { selection = { preselect = false, auto_insert = true } },

    menu = {
      -- nvim-cmp style menu
      draw = {
        columns = {
          { "label", "label_description", gap = 1 },
          { "kind_icon", "kind" }
        },
      }
    },

    -- Show documentation when selecting a completion item
    documentation = { auto_show = true, auto_show_delay_ms = 500 },
  },

  sources = {
    -- Remove 'buffer' if you don't want text completions, by default it's only enabled when LSP returns no items
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
  -- Experimental signature help support
  signature = { enabled = true }
})

require("kitty-scrollback").setup()
