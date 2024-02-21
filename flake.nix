{
  description = "Mx Neovim configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    neovim = {
      url = "github:neovim/neovim/stable?dir=contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs@{ self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system: let
      # Override neovim with the one from the flake inputs
      overlayFlakeInputs = prev: final: {
        neovim = inputs.neovim.packages.${system}.neovim;
      };

      # Define a new package `mxNeovim`
      overlayMxNeovim = prev: final: {
        mxNeovim = import ./lib {
          pkgs = final;
        };
      };

      pkgs = import inputs.nixpkgs {
        inherit system;
        overlays = [ overlayFlakeInputs overlayMxNeovim ];
      };
    in {
      packages.default = pkgs.mxNeovim;
    }
  );
}
