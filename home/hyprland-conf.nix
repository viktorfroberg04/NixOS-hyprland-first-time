{ config, pkgs, ... }: {

  imports = [
    ./waybar
    ./binds.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;

    settings = {

      input.kb_layout = "se";
      input.kb_variant = "";

      "$mod" = "SUPER";
      "$shiftMod" = "SUPER_SHIFT";      

      exec-once = [ "/etc/nixos/set-theme.sh"
      ];
    };
  };
}
