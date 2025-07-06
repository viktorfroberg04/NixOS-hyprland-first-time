# Hyprpaper is used to set the wallpaper on the system
{ lib, ... }: {
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;

      preload = [ "~/nixos-config/home/wallpapers/forrest.png" ];
      wallpaper = [ ",~/nixos-config/home/wallpapers/forrest.png" ];
    };
  };
}
