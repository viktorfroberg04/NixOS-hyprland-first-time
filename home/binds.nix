{ pkgs, ... }: {

  wayland.windowManager.hyprland.settings = {
    bind = [
      # Program launchers
      "$mod, Return, exec, kitty"                          # Terminal
      "$mod, D, exec, rofi -show drun"                     # App launcher
      "$mod, M, exec, wlogout -b 2"                        # Logout menu

      # Window management
      "$mod, Q, killactive"                               # Close window
      "$mod, F, fullscreen"                               # Toggle fullscreen
      "$mod, Space, togglefloating"                       # Toggle floating

      # Reload Hyprland
      "$shiftMod, R, exec, hyprctl reload"

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

      # move focus
      "$mod, left, movefocus, l"
      "$mod, right, movefocus, r"
      "$mod, up, movefocus, u"
      "$mod, down, movefocus, d"

      # scroll through existing workspaces
      "$mod, mouse_down, workspace, e+1"
      "$mod, mouse_up, workspace, e-1"

      "$shiftMod, right, resizeactive, 30 0"
      "$shiftMod, left, resizeactive, -30 0"
      "$shiftMod, up, resizeactive, 0 -30"
      "$shiftMod, down, resizeactive, 0 30"

      "$shiftMod, L, moveactive, 30 0"
      "$shiftMod, I, moveactive, -30 0"
      "$shiftMod, O, moveactive, 0 -30"
      "$shiftMod, K, moveactive, 0 30" 
    ];

    bindm = [
      # move/resize windows
      "$mod, mouse:272, movewindow"
      "$shiftMod, mouse:272, resizewindow"
    ];
  };
}
