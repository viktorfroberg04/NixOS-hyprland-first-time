{
  programs.kitty = {
    enable = true;
    settings = {
      confirm_os_window_close = "0";
      background_opacity = "0.85";
    };
    extraConfig = builtins.readFile (
      if builtins.pathExists "${config.home.homeDirectory}/.cache/wal/colors-kitty.conf"
      then "${config.home.homeDirectory}/.cache/wal/colors-kitty.conf"
      else ./fallback-kitty.conf  # <-- fallback you can define yourself
    );
  };

}
