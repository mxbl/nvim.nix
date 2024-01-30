local opt = vim.opt

-- Floating window popup menu for completion on command line
opt.pumblend = 17
opt.wildmode = "longest:full"
opt.wildoptions = "pum"

opt.guicursor = ""

opt.nu = true
opt.relativenumber = true
opt.cursorline = true
opt.cursorlineopt = "screenline,number"

opt.errorbells = false
opt.showcmd = false

-- Tabs
opt.autoindent = true
opt.cindent = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true

opt.breakindent = true
opt.wrap = true
opt.showbreak = "   │" --string.rep(" ", 3)
opt.linebreak = true

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

-- Give more space for displaying messages
opt.cmdheight = 1

-- Having longer updatetime (default is 4000ms = 4s) leads to noticable
-- delays and poor user experience
opt.updatetime = 50


opt.colorcolumn = ""


opt.belloff = "all"
opt.clipboard = "unnamedplus"
opt.inccommand = "split"
opt.laststatus = 3
opt.mouse = "a"
opt.autowriteall = true

opt.formatoptions = opt.formatoptions
  - "a"
  - "t" -- don't auto format
  - "o" -- O and o, don't continue comments
  + "r" --   but do continue when pressing enter
  + "c" -- comments respect textwidth
  + "q" -- allow formatting comments
  - "2"

opt.ruler = false
opt.fillchars = { vert = "│", eob = "~" }
opt.list = true
opt.listchars = {
    tab   = "» ",
    eol   = "↲",
    space  = "·",
    trail = "~"
}
-- tab: "▸ ", eol = "¬"
-- lead  = "·", only leading spaces

vim.cmd([[
    augroup InitAutoCommands
        au!
        au FileType conf,sh,tmux,xdefaults setlocal foldmethod=marker
    augroup END
]])

--vim.g.rust_conceal = 0
vim.o.conceallevel = 2
vim.o.concealcursor = ""

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- Don't pass messages to |ins-completion-menu|
vim.opt.shortmess:append "c"
