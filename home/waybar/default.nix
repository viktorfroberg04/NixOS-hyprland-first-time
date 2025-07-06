{ ... }:

{
  # status bar for hyprland/wayland
  programs.waybar = {
    enable = true;
    # catppuccin.enable = true;
    settings = [
      {
        position = "top";
        margin-top = 8;
        margin-bottom = 0;
        layer = "top";
        margin-left = 8;
        margin-right = 8;
        spacing = 10;
        fixed-center = true;
        exclusive = true;
        include = [ "${./shared.json}" ];
        modules-left = [
          "hyprland/workspaces"
          "wlr/taskbar"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "group/hardware"
          "pulseaudio"
          "network"
          "custom/exit"
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
