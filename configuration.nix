# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./system/audio.nix
      ./system/fonts.nix
      ./system/general.nix
      ./system/hardware-configuration.nix
      ./system/home-manager.nix
      ./system/hyprland.nix
      ./system/loc-settings.nix
      ./system/systemd-boot.nix
      ./system/users.nix
      ./system/variables.nix
      <home-manager/nixos>
    ];

    home-manager.users."${config.var.username}" = import ./home/home.nix;

    system.stateVersion = "25.05";
}
