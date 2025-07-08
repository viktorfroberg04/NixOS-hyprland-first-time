{ config, pkgs, ... }:

{
  programs.wlogout = {
    enable = true;
    
    # Layout configuration matching your JSON
    layout = [
      {
        label = "lock";
        action = "hyprlock";
        keybind = "l";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        keybind = "r";
      }
      {
        label = "logout";
        action = "loginctl terminate-user $USER";
        keybind = "e";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        keybind = "s";
      }
    ];
    
    # Reference your style.css file
    style = builtins.readFile ./style.css;
  };
}