{ config, pkgs, ... }:

{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
        grace = 0;
      };

      background = [{
        monitor = "";
        path = "$HOME/nixos-config/home/wallpapers/yosemite.png";
        blur_passes = 0;
      }];

      # Import pywal colors
      source = "$HOME/.cache/wal/colors-hyprland.conf";

      # Time display
      label = [
        {
          monitor = "";
          text = "cmd[update:1000] echo \"$(date +\"%H:%M\")\"";
          color = "$color7";
          font_size = 80;
          font_family = "JetBrains Mono ExtraBold";
          position = "0, 100";
          halign = "center";
          valign = "center";
        }

        # Greeting
        {
          monitor = "";
          text = "Hello $USER!";
          color = "$color7";
          font_size = 20;
          font_family = "JetBrains Mono Light";
          position = "0, 0";
          halign = "center";
          valign = "center";
        }
      ];

      # Password input field
      input-field = [{
        monitor = "";
        size = "230, 40";
        outline_thickness = 0;
        dots_size = 0.2;
        dots_spacing = 0.4;
        dots_center = true;
        inner_color = "$color1";
        font_color = "$color7";
        fade_on_empty = false;
        placeholder_text = "<span foreground='white'><i>Password</i></span>";
        fail_color = "$color7";
        hide_input = false;
        position = "0, -50";
        halign = "center";
        valign = "center";
      }];
    };
  };
}