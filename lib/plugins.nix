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
in

[
  # telescope
  plenary-nvim
  telescope-nvim

  # treesitter
  nvim-treesitter.withAllGrammars
  nvim-treesitter-context

  # theme and colors
  colorbuddy-nvim
  nvim-colorizer-lua
  nvim-web-devicons
  gruvbuddy

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
]
