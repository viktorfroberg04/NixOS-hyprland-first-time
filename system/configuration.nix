# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./audio.nix
      ./fonts.nix
      ./general.nix
      ./hardware-configuration.nix
      ./home-manager.nix
      ./hyprland.nix
      ./loc-settings.nix
      ./systemd-boot.nix
      ./users.nix
      ./variables.nix
    ];

    home.manager.users."${config.var.username}" = import ../home/home.nix;

    system.stateVersion = "25.05";
}
