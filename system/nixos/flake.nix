{
  description = "My NixOS Configuration + custom my-shell package";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  
    astal = {
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.astal.follows = "astal";
    };

    nvf.url = "github:notashelf/nvf";

    superfile.url = "github:yorukot/superfile";

  };

  outputs = inputs @ { self, nixpkgs, astal, ags, nvf, superfile, ... }: let
    system = "x86_64-linux";
    pkgs   = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
        ./hardware-configuration.nix
        ./boot.nix
        ./shell.nix
        ./wifi.nix
        ./neovim.nix
        ./superfile.nix
        ./desktop-environment.nix
        inputs.nvf.nixosModules.default
      ];
    };

    packages.${system}.default = pkgs.stdenv.mkDerivation {
      name = "zhell";
      src  = ./.;

      nativeBuildInputs = [
        pkgs.wrapGAppsHook
        pkgs.gobject-introspection
        pkgs.ags.packages.${system}.default
      ];

      buildInputs = [
        pkgs.gjs
        pkgs.glib
        astal.io
        astal.astal4
      ];

      installPhase = ''
        ags bundle app.ts $out/bin/zhell
      '';
      preFixup = ''
        gappsWrapperArgs+=(
          --prefix PATH : ${pkgs.lib.makeBinPath ([
            # runtime executables
          ])}
        )
      '';
    };
  };
}
