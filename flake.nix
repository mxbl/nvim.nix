{
  description = "Mx Neovim configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    neovim = {
      url = "github:neovim/neovim/stable?dir=contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, ... }:
    let

    # Override neovim with the one from the flake inputs
    overlayFlakeInputs = prev: final: {
      neovim = inputs.neovim.packages.x86_64-linux.neovim;
    };

    # Define a new package `mxNeovim`
    overlayMxNeovim = prev: final: {
      mxNeovim = import ./lib {
        pkgs = final;
      };
    };

    pkgs = import inputs.nixpkgs {
      system = "x86_64-linux";
      overlays = [ overlayFlakeInputs overlayMxNeovim ];
    };
    in {
      packages.x86_64-linux.default = pkgs.mxNeovim;
      apps.x86_64-linux.default = {
        type = "app";
        program = "${pkgs.mxNeovim}/bin/nvim";
      };
    };
}
