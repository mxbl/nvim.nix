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
  colorbuddy-nvim
  nvim-colorizer-lua
  telescope-nvim
  plenary-nvim
  nvim-treesitter.withAllGrammars
  nvim-treesitter-context
  lir-nvim
  nvim-web-devicons
  gitsigns-nvim
  neogit
  gruvbuddy
  comment
]
