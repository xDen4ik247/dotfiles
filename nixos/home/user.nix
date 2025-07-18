{ config, pkgs, inputs, ... }:

# let
#   user = builtins.getEnv "TARGET_USER";
# in

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  users.users.ziggyss = {
    isNormalUser = true;
    description = "ZiggySS";
    extraGroups = [ "networkmanager" "wheel" ];
  };
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users.ziggyss = import ./home.nix;
  };
}
