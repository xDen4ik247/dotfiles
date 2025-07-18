{ config, ... }:

{
  imports = [
    # ./home.nix
    ./neovim.nix
    ./superfile.nix
    ./user.nix
  ];
}
