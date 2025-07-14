{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ cava ];

  xdg.configFile."cava/config".source =
    config.home.homeDirectory + "/.cache/wal/colors-cava";
}