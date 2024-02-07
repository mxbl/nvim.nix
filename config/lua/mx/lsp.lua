local copilot = require 'copilot'
local lspconfig = require 'lspconfig'

local function on_attach(cli, buf)
  local opts = { buffer = buf, remap = false }

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<leader>d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', 'cr', vim.lsp.buf.rename, opts)
  vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
end

local language_servers = {
  gopls = {
    settings = {
      gopls = {
        gofumpt = true,
      },
    },
  },
  nil_ls = {
    settings = {
      ['nil'] = {
        formatting = { command = { 'nixpkgs-fmt' } },
      },
    }
  },
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' },
        },
        runtime = {
          version = 'LuaJIT',
        },
        telemetry = {
          enable = false,
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file('', true),
        },
      },
    }
  },
}

local function init()
  copilot.setup {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        accept = "<C-y>",
      },
    },
    filetypes = {
      md = false,
    },
  }

  -- initialize servers
  for server, config in pairs(language_servers) do
    local opt = { on_attach = on_attach }
    if config then
      for k, v in pairs(config) do
        opt[k] = v
      end
    end

    lspconfig[server].setup(opt)
  end
end

-- vim.diagnostic.config({
--   virtual_text = true,
-- })

require'fidget'.setup {
  notification = {
    window = {
      winblend = 10,
      relative = "editor",
    },
  },
}

return {
  init = init,
}
