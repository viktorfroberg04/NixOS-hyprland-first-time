{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        # Language support
        ms-python.python
        jnoortheen.nix-ide
      ];
      
      userSettings = {
      };
    };
  };
}
