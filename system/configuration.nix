# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./audio.nix
      ./users.nix
      ./systemd-boot.nix
      ./loc-settings.nix
      <home-manager/nixos>
      ./hyprland.nix
      ./general.nix
      ./fonts.nix

      #Let this be here
      ./hardware-configuration.nix
      ./variables.nix
  ];
  home-manager.users."${config.var.username}" = import ./home.nix;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
