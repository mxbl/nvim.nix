{ pkgs }:

with pkgs.vimPlugins;
with pkgs.vimUtils;

let
  gruvbuddy = buildVimPlugin {
    name = "gruvbuddy";
    src = pkgs.fetchgit {
      url = "https://github.com/tjdevries/gruvbuddy.nvim";
      hash = "sha256-lN95pAc04rxMsQdlkR9g6y/D3EcaelwmLJ9yoIs6N5k=";
    };
  };
  comment = buildVimPlugin {
    name = "Comment";
    src = pkgs.fetchgit {
      url = "https://github.com/numToStr/Comment.nvim";
      hash = "sha256-+dF1ZombrlO6nQggufSb0igXW5zwU++o0W/5ZA07cdc=";
    };
  };
  expressline = buildVimPlugin {
    name = "el";
    src = pkgs.fetchgit {
      url = "https://github.com/tjdevries/express_line.nvim";
      hash = "sha256-1VwcjgN+YJMidHKVXGAb0e90TGGoCsCJ7oiHvzOtIdc=";
    };
  };
  inlayhints = buildVimPlugin {
    name = "inlay-hints";
    src = pkgs.fetchgit {
      url = "https://github.com/simrat39/inlay-hints.nvim";
      hash = "sha256-cDWx08N+NhN5Voxh8f7RGzerbAYB5FHE6TpD4/o/MIQ=";
    };
  };
in

[
  # telescope
  plenary-nvim
  telescope-nvim

  # treesitter
  nvim-treesitter.withAllGrammars
  nvim-treesitter-context

  # appearance
  colorbuddy-nvim
  nvim-colorizer-lua
  nvim-web-devicons
  gruvbuddy
  expressline

  lir-nvim
  gitsigns-nvim
  neogit
  comment
  nvim-surround

  nvim-lspconfig
  copilot-lua
  go-nvim
  rust-tools-nvim
  fidget-nvim
  lsp-status-nvim
  inlayhints
]
