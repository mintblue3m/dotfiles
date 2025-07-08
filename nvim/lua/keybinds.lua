vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<space>fF", ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})<CR>")
