{ config, pkgs, lib, ... }:

{ 
  boot = {
    loader = {
      grub = {
        enable = true;
        efiSupport = true;
        useOSProber = true;
        devices = [ "nodev" ];
	theme = "${pkgs.kdePackages.breeze-grub}/grub/themes/breeze";
      };
      efi = {
        canTouchEfiVariables = true;
	efiSysMountPoint = "/boot";
      };
    };
  };
}
