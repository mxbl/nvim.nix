vim.g.mapleader = " "

require'telescope'.setup({})

local builtin = require "telescope.builtin"
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
