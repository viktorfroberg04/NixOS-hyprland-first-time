{ config, pkgs, ... }:
let 
  username = config.var.username;
  andusername = config.var.andusername;
in {
  users = {
    users.${username} = {
      isNormalUser = true;
      description = "${username}";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [
        kdePackages.kate
        # thunderbird
      ];
    };

    users.${andusername} = {
      isNormalUser = true;
      description = "${andusername}";
      extraGroups = [ "networkmanager" ];
      packages = with pkgs; [
        kdePackages.kate
      ];
    };
  };
}
