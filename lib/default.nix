{ pkgs }:

let
  #plugins = import ./plugins.nix { inherit pkgs; };

  #mxNvimPlugin = pkgs.vimUtils.buildVimPlugin {
  #  name = "mx";
  #  src = ../config;
  #};

  #init = ''
  #  :lua require('mx')
  #'';

  extraPackages = with pkgs; [
    cargo
    cargo-deny
    cargo-edit
    cargo-watch
    gcc
    go

    # language servers
    gopls
    lua-language-server
    haskell-language-server
    rust-analyzer
    nil
    lexical

    # formatters
    nixpkgs-fmt
    golines
    gofumpt
    rustfmt
  ];
in

pkgs.wrapNeovim pkgs.neovim {
  #configure = {
  #  customRC = init;
  #  packages.all.start = plugins ++ [ mxNvimPlugin ];
  #};
  extraMakeWrapperArgs = ''--suffix PATH : "${pkgs.lib.makeBinPath extraPackages}"'';
  withNodeJs = true;
}
