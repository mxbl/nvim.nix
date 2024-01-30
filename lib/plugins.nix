{ pkgs }:

with pkgs.vimPlugins;

[
  colorbuddy-nvim
  nvim-colorizer-lua
  telescope-nvim
  plenary-nvim
  nvim-treesitter.withAllGrammars
  nvim-treesitter-context
  lir-nvim
  nvim-web-devicons
]
