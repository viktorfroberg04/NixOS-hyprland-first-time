{ ... }:

{
  # status bar for hyprland/wayland
  programs.waybar = {
    enable = true;
    settings = [
      {
        position = "top";
        include = [ "${./shared.json}" ];
        modules-left = [
          "hyprland/workspaces"
        ];
        modules-center = [
          "clock#2"
          "tray"
          "clock#3"
        ];
        modules-right = [
          "pulseaudio"
          "memory"
          "cpu"
          "battery"
          "group/group-power"
        ];
      }
    #  {
      #  position = "bottom";
      #  include = [ "${./shared.json}" ];
      #  modules-left = [
      #    "custom/spotify"
      #    "custom/mpris"
      #  ];
      #  modules-center = [
      #    "hyprland/window"
      #  ];
      #  modules-right = [
      #    "hyprland/language"
      #    "network"
      #    "group/group-power"
      #  ];
    #  }
    ];
    style = builtins.readFile ./style.css;
    systemd.enable = true;
  };
}
