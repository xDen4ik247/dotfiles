{ config, pkgs, ... }:

{ 
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    shellInit = ''
      source "${pkgs.zinit}/share/zinit/zinit.zsh"
    '';
    interactiveShellInit = ''
      zinit light https://github.com/nullxception/roundy
    '';
  };
  users.defaultUserShell = pkgs.zsh;
  environment.systemPackages = [
    pkgs.nerd-fonts.jetbrains-mono
  ];
}
