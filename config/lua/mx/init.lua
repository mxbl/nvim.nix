vim.g.mapleader = " "

require'telescope'.setup({})

local builtin = require "telescope.builtin"
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})

local nav = require'mx.tmux'.navigate
vim.keymap.set('n', '<C-h>', function() nav('h') end, {})
vim.keymap.set('n', '<C-j>', function() nav('j') end, {})
vim.keymap.set('n', '<C-k>', function() nav('k') end, {})
vim.keymap.set('n', '<C-l>', function() nav('l') end, {})

require 'mx.options'
require 'mx.colors'
