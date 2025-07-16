{ config, pkgs, lib, ... }:

{
  boot = {
    kernelModules = [ "8852bu" ];
    extraModulePackages = [ config.boot.kernelPackages.rtl8852bu ];
  };

  services.udev.extraRules = ''
    ATTR{idVendor}=="0bda", ATTR{idProduct}=="1a2b", RUN+="${lib.getExe pkgs.usb-modeswitch} -K -v 0bda -p 1a2b"
  '';
}
