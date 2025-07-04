# Hyprpaper is used to set the wallpaper on the system
{ lib, ... }: {
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;

      preload = [ "/etc/nixos/hyprpaper/FWG_2560x1440.jpg" ];
      wallpaper = [ ",/etc/nixos/hyprpaper/FWG_2560x1440.jpg" ];
    };
  };
}
