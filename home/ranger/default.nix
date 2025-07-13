{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    ranger
    highlight      # Syntax highlighting in previews
    atool          # Archive previews (zip, tar, etc.)
    w3m            # Image previews in terminal (optional)
    ueberzugpp     # Better image preview in terminals that support it
  ];

  # Minimal config for ranger
  xdg.configFile."ranger/rc.conf".text = ''
    set preview_images true
    set preview_images_method ueberzug
    set use_preview_script true
    set draw_borders true
  '';
}