{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # GTK themes and Qt theming tools
    adwaita-icon-theme
    gnome-themes-extra
    libadwaita
  ];

    # Use Home Manager's GTK module instead of manual config files
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
  };

  # GTK 4 theming (the key part!)
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };


  # Qt and theme environment variables
  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt6ct";
    QT_STYLE_OVERRIDE = "kvantum"; # optional, use if you want Kvantum styling
    XDG_CURRENT_DESKTOP = "Hyprland";
  };
}
