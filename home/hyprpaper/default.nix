# Hyprpaper is used to set the wallpaper on the system
{ lib, ... }: {
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;

      preload = [ "~/nixos-config/home/wallpapers/0008.jpg" ];
      wallpaper = [ ",~/nixos-config/home/wallpapers/0008.jpg" ];
    };
  };
}
