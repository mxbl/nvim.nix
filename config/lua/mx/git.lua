local neogit = require 'neogit'

neogit.setup {
  disable_context_highlighting = false,
}

vim.keymap.set('n', '<leader>gs', neogit.open, {})

require 'mx.signs'
