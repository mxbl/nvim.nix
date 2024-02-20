vim.g.mapleader = " "

require'nvim-treesitter.configs'.setup {
  highlight = { enable = true },
  indent = { enable = true },
  rainbow = { enable = true },
}

require'treesitter-context'.setup({
  max_lines = 1,
})

require'telescope'.setup({})

local builtin = require "telescope.builtin"
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
vim.keymap.set('n', '<leader>pw', function()
  builtin.grep_string({
    search = vim.fn.expand("<cword>"),
  })
end, {})

vim.keymap.set('n', ',h', builtin.help_tags, {})

local nav = require'mx.tmux'.navigate
vim.keymap.set('n', '<C-h>', function() nav('h') end, {})
vim.keymap.set('n', '<C-j>', function() nav('j') end, {})
vim.keymap.set('n', '<C-k>', function() nav('k') end, {})
vim.keymap.set('n', '<C-l>', function() nav('l') end, {})

require'nvim-surround'.setup()

require 'mx.options'
require 'mx.lir'
require 'mx.colors'
require 'mx.git'
require 'mx.comments'
require 'mx.languages'

require 'mx.lsp'.init()
