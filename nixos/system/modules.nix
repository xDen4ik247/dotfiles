{ config, ... }:

{
  imports = [
    ./boot.nix
    ./desktop-environment.nix
    ./locale.nix
    ./shell.nix
    ./wifi.nix
  ];
}

