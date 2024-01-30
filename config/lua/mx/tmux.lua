-- rewriting vim tmux navigator in lua

local utils = require("mx.utils")
local job = require('plenary.job')

local TMUX_EXE = 'tmux'
local TMUX = os.getenv('TMUX')

local function is_tmux()
  return TMUX ~= nil
end

local function vim_navigate(direction)
  vim.api.nvim_command('wincmd ' .. direction)
end

-- Translate vim directions letters to tmux
local function tmux_direction(direction)
  local direction_lookup = { h = "L", j = "D", k = "U", l = "R" }
  return direction_lookup[direction]
end

local tmux = {}

tmux.socket = function()
  if is_tmux() then
    local socket = utils.string.split(TMUX, ',')
    return socket[1]
  end
end

tmux.run = function(arguments)
  local args = {"-S", tmux.socket()}
  for _, v in ipairs(arguments) do
    table.insert(args, v)
  end

  job:new {
    command = TMUX_EXE,
    args    = args,
    skip_validation = true,
  }:start()
end

tmux.navigate = function(direction)
  -- Catch wrong input, direction must be a valid argument wincmd
  if not utils.list.has_value({'h','j','k','l','p'}, direction) then
    return false
  end

  local winnr = vim.fn.winnr()

  vim_navigate(direction)

  -- if winnr == vim.fn.winnr() we tried to navigate out of nvim 
  -- to a tmux pane in that direction
  if is_tmux() and winnr == vim.fn.winnr() then
    local args = {
      'select-pane',
      '-t',
      os.getenv('TMUX_PANE'),
      '-'..tmux_direction(direction),
    }
    --local args = 'select-pane -t '..os.getenv('TMUX_PANE')..
    --  ' -'..tmux_direction(direction)
    tmux.run(args)
  end
end

return tmux
