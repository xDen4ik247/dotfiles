{ pkgs, ...}:

{ services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    package = pkgs.kdePackages.sddm;

    extraPackages = with pkgs; [
      sddm-astronaut
      kdePackages.qtsvg
      kdePackages.qtvirtualkeyboard
      kdePackages.qtmultimedia
    ];
    theme = "sddm-astronaut-theme";
    settings = {
      Theme = {
        Current = "sddm-astronaut-theme";
      };
    };
  };
  programs.hyprland.enable = true;

  environment.systemPackages = [
    (pkgs.sddm-astronaut.override {
      embeddedTheme = "hyprland_kath";
     })
    pkgs.kitty
    pkgs.fuzzel
  ];
}
