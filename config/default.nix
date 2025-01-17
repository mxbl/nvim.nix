{ pkgs }:

let
  scripts2ConfigFiles = dir:
	  let
		  configDir = pkgs.stdenv.mkDerivation {
			  name = "nvim-${dir}-configs";
				src = ./${dir};
				installlPhase = ''
				  mkdir -p $out/
					cp -r ./* $out/
				'';
			};
		in builtins.map (file: "${configDir}/${file}")
				(builtins.attrNames (builtins.readDir configDir));
	
	sourceConfigFiles = files:
	  builtins.concatStringsSep "\n" (builtins.map (file:
		  (if pkgs.lib.strings.hassuffix "lua" file then "luafile" else "source")
			+ " ${file}" files);
	
	vim = scripts2ConfigFiles "vim";
	lua = scripts2ConfigFiles "lua";
in

builtins.concatStringsSep "\n" (builtins.map (configs: sourceConfigFiles configs) [ vim lua ]) 
