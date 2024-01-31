{ pkgs }:

let
  plugins = import ./plugins.nix { inherit pkgs; };

  mxNvimPlugin = pkgs.vimUtils.buildVimPlugin {
    name = "mx";
    src = ../config;
  };

  init = ''
    :lua require('mx')
  '';

  extraPackages = with pkgs; [
    go

    # language servers
    gopls
    lua-language-server
    rust-analyzer
    nil

    # formatters
    nixpkgs-fmt
    golines
    gofumpt
    rustfmt
  ];
in

pkgs.wrapNeovim pkgs.neovim {
  configure = {
    customRC = init;
    packages.all.start = plugins ++ [ mxNvimPlugin ];
  };
  extraMakeWrapperArgs = ''--suffix PATH : "${pkgs.lib.makeBinPath extraPackages}"'';
  withNodeJs = true;
}
