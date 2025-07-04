{ pkgs, ... }: {

  wayland.windowManager.hyprland.settings = {
    bind = [
      # Program launchers
      "$mod, Return, exec, kitty"                          # Terminal
      "$mod, D, exec, rofi -show drun"                     # App launcher
      "$mod SHIFT, Q, exec, hyprctl dispatch exit"         # Logout menu

      # Window management
      "$mod, Q, killactive"                               # Stäng fönster
      "$mod, F, fullscreen"                               # Toggle fullscreen
      "$mod, Space, togglefloating"                       # Toggle flytande

      # Reload Hyprland
      "$mod SHIFT, R, exec, hyprctl reload"

      # Switch to workspace 1-10
      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"
      "$mod, 6, workspace, 6"
      "$mod, 7, workspace, 7"
      "$mod, 8, workspace, 8"
      "$mod, 9, workspace, 9"
      "$mod, 0, workspace, 10"

      # Move active window to workspace
      "$shiftMod, 1, movetoworkspace, 1"
      "$shiftMod, 2, movetoworkspace, 2"
      "$shiftMod, 3, movetoworkspace, 3"
      "$shiftMod, 4, movetoworkspace, 4"
      "$shiftMod, 5, movetoworkspace, 5"
      "$shiftMod, 6, movetoworkspace, 6"
      "$shiftMod, 7, movetoworkspace, 7"
      "$shiftMod, 8, movetoworkspace, 8"
      "$shiftMod, 9, movetoworkspace, 9"
      "$shiftMod, 0, movetoworkspace, 10"

      # Cycle through workspaces
      "$mod, Tab, workspace, e+1"
      "$shiftMod, Tab, workspace, e-1"

      # Move to next/previous workspace with arrow keys
      "$mod, right, workspace, e+1"
      "$mod, left, workspace, e-1"

      # Move window to next/previous workspace
      "$shiftMod, right, movetoworkspace, e+1"
      "$shiftMod, left, movetoworkspace, e-1"
    ];

  };
}
