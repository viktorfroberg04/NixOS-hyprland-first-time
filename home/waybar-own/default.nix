{ ... }:

{
  # status bar for hyprland/wayland
  programs.waybar = {
    enable = true;
    settings = [
      {
        position = "top";
        layer = "top";
        margin-top = 6;
        margin-bottom = -2;
        margin-left = 8;
        margin-right = 8;
        spacing = 8;
        fixed-center = true;
        include = [ "${./shared.json}" ];
        modules-left = [
          "hyprland/workspaces"
          "wlr/taskbar"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "cpu"
          "temperature"
          "memory"
          "pulseaudio"
          "network"
          "custom/exit"
        ];
      }
    ];
    style = builtins.readFile ./style.css;
  };
}