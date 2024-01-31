{ pkgs }:

let

plugins = import ./plugins.nix { inherit pkgs; };

mxNvimPlugin = pkgs.vimUtils.buildVimPlugin {
  name = "mx";
  src = ../config;
};

#gruvbuddy = pkgs.vimUtils.buildVimPlugin {
#  name = "gruvbuddy";
#  src = pkgs.fetchgit {
#    url = "https://github.com/tjdevries/gruvbuddy.nvim";
#    hash = "sha256-lN95pAc04rxMsQdlkR9g6y/D3EcaelwmLJ9yoIs6N5k=";
#  };
#};

init = ''
  :lua require('mx')
'';

in

pkgs.wrapNeovim pkgs.neovim {
  configure = {
    customRC = init;
    packages.all.start = plugins ++ [ mxNvimPlugin ];
  };
}
