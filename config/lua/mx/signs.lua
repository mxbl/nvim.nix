local ok, signs = pcall(require, "gitsigns")
if not ok then
  return
end

require "colorbuddy"

local c = require("colorbuddy.color").colors
local Group = require("colorbuddy.group").Group

Group.new("GitSignsAdd", c.green:light())
Group.new("GitSignsChange", c.yellow:light())
Group.new("GitSignsUntracked", c.cyan:light())
Group.new("GitSignsDelete", c.red)

signs.setup {
  signs = {
    add = { hl = "GitSignsAdd", text = "│" },
    change = { hl = "GitSignsChange", text = "│" },
    delete = { hl = "GitSignsDelete", text = "_" },
    topdelete = { hl = "GitSignsDelete", text = "‾" },
    changedelete = { hl = "GitSignsDelete", text = "~" },
    untracked = { hl = "GitSignsUntracked" },
  },

  -- Highlights just the number part of the number column
  numhl = false,

  -- Highlights the _whole_ line.
  --    Instead, use gitsigns.toggle_linehl()
  linehl = false,

  -- Highlights just the part of the line that has changed
  --    Instead, use gitsigns.toggle_word_diff()
  word_diff = false,
}

-- TODO: decide mappings for this
-- local nnoremap = vim.keymap.nnoremap
-- nnoremap { "<space>tsw", signs.toggle_word_diff }
-- nnoremap { "<space>tsh", signs.toggle_word_diff }
