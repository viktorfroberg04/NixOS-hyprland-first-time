{
  config,
  lib,
  pkgs,
  ...
}:
{
  xdg.configFile."rofi/theme.rasi".source = ./theme.rasi;

  programs.rofi = {
    enable = true;
    cycle = false;

    package = pkgs.rofi-wayland;

    extraConfig = {
      modi = "drun,filebrowser";
      font = "Noto Sans CJK JP 12";
      show-icons = true;
      disable-history = false;
      sort-by-frequency = true;
      frequency-num-entries = 8;
      hover-select = true;
      bw = 0;
      display-drun = "";
      display-window = "";
      display-combi = "";
      icon-theme = "Fluent-dark";
      terminal = "kitty";
      drun-match-fields = "name";
      drun-display-format = "{name}";
      me-select-entry = "";
      me-accept-entry = "MousePrimary";
      kb-cancel = "Escape,MouseMiddle";
    };
    theme = "~/.config/rofi/theme.rasi";
  };

  home.sessionVariables.ROFI_THEME = "${config.xdg.configHome}/rofi/theme.rasi";
}
