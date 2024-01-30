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
in

pkgs.wrapNeovim pkgs.neovim {
  configure = {
	  customRC = init;
		packages.all.start = plugins ++ [ mxNvimPlugin ];
	};
}
