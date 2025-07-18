{ config, pkgs, inputs, ... }:
{
  environment.systemPackages = [
    inputs.superfile.packages.${pkgs.system}.default
  ];
}
