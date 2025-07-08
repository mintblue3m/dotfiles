-- OPTIONS
local set = vim.opt
local o = vim.o
local g = vim.g

set.autoread = true
set.undofile = true
--line nums
set.relativenumber = true
set.number = true

-- indentation and tabs
set.tabstop = 4
set.shiftwidth = 4
set.autoindent = true
set.expandtab = true

-- search settings
set.ignorecase = true
set.smartcase = true

-- appearance
set.termguicolors = true
set.background = "dark"
set.signcolumn = "yes"

-- cursor line
set.cursorline = true

-- 80th column
set.colorcolumn = "80"

-- backspace
set.backspace = "indent,eol,start"

-- split windows
set.splitbelow = true
set.splitright = true

-- keep cursor at least 8 rows from top/bot
set.scrolloff = 8


-- incremental search
set.incsearch = true

-- interval for writing swap file to disk, also used by gitsigns
set.updatetime = 300

-- disable some default providers
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
