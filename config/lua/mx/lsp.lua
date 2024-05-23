local copilot = require 'copilot'
local lspconfig = require 'lspconfig'
local rust_tools = require 'rust-tools'

local function on_attach(cli, buf)
  local opts = { buffer = buf, remap = false }

  if cli.name == "gopls" or cli.name == "rust_analyzer" then
    require'inlay-hints'.on_attach(cli, buf)
  end

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'cr', vim.lsp.buf.rename, opts)
  vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
end

local inlay = require'mx.inlay'

local language_servers = {
  gopls = {
    settings = {
      gopls = {
        hints = inlay and {
          assignVariableTypes = true,
          compositeLiteralFields = true,
          compositeLiteralTypes = true,
          constantValues = true,
          functionTypeParameters = true,
          parameterNames = true,
          rangeVariableTypes = true,
        },
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
  hls = {},
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

  rust_tools.setup {
    tools = {
      inlay_hints = {
        auto = false,
      },
    },
    server = {
      on_attach = on_attach,
      settings = {
        ['rust-analyzer'] = {
          cargo = {
            buildScripts = {
              enable = true,
            },
          },
          diagnostics = {
            enable = true,
          },
          files = {
            excludeDirs = { ".direnv", ".git" },
            watcherExclude = { ".direnv", ".git" },
          },
        },
      },
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

  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
  vim.keymap.set('n', '<leader>d', vim.diagnostic.goto_next)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_prev)

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
  progress = {
    display = {
      progress_ttl = 10,
    },
  },
}

return {
  init = init,
}
