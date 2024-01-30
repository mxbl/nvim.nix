local M = {}

M.cwd = function()
  return vim.loop.cwd()
end

M.if_nil = function(x, was_nil, was_not_nil)
  if x == nil then
    return was_nil
  else
    return was_not_nil
  end
end

M.cycle = function(i, n)
  return i % n == 0 and n or i % n
end

M.get_default = function(x, default)
  return M.if_nil(x, default, x)
end

M.repeated_table = function(n, val)
  local empty_lines = {}
  for _ = 1, n do
    table.insert(empty_lines, val)
  end
  return empty_lines
end

M.buf_delete = function(bufnr)
  if bufnr == nil then
    return
  end

  local start_report = vim.o.report
  if start_report < 2 then
    vim.o.report = 2
  end

  if vim.api.nvim_buf_is_valid(bufnr) and vim.api.nvim_buf_is_loaded(bufnr) then
    vim.api.nvim_buf_delete(bufnr, { force = true })
  end

  if start_report < 2 then
    vim.o.report = start_report
  end
end

M.list = {}

-- Return true `tabl` contains `value`
M.list.has_value = function(tabl, value)
  for _, val in ipairs(tabl) do
    if val == value then
      return true
    end
  end
  return false
end

M.string = {}

-- A split string function which behaves like in python or perl
-- split `str` at `pat` and return a list of all parts
M.string.split = function(str, pat)
  local t = {}
  local fpat = "(.-)" .. pat
  local last_end = 1
  local s, e, cap = str:find(fpat, 1)
  while s do
    if s ~= l or cap ~= "" then
      table.insert(t, cap)
    end
    last_end = e+1
    s, e, cap = str:find(fpat, last_end)
  end
  if last_end <= #str then
    cap = str:sub(last_end)
    table.insert(t, cap)
  end
  return t
end

-- Some algorithms {{{
-- Fibonacci with tables
M.fib_t = function(n)

  local T = {}
  T[1], T[2] = 0, 1
  for i=1,n-1 do
    T[i+1] = T[i+1] + T[i]
    T[i+2] = T[i]
  end

  T[#T] = T[#T] + T[#T-1]
  return T[#T]
end
-- }}}

return M
