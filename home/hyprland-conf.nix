{ config, pkgs, ... }: {

  imports = [
    ./waybar
    ./binds.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    # catppuccin.enable = true;

    settings = {

      input.kb_layout = "se";
      input.kb_variant = "";

      "$mod" = "SUPER";
      "$shiftMod" = "SUPER_SHIFT";      
     
    };
  };
}
