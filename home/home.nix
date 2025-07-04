{ config, pkgs, ... }: {

  imports = [
    # User config
    ./variables.nix

    # Programs
    ./kitty.nix

    # System
    ./hyprland-conf.nix
    ./hyprpaper
  ];
    
  home = {
    inherit (config.var) username;
    homeDirectory = "/home/" + config.var.username;

    
    # Packages that should be installed to the user profile.
    packages = with pkgs; [
      #Apps
      librewolf
      vscode
      inkscape
      gimp
      firefox
      kitty
      pywal

      # Dev
      python3
      
    ];


    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "25.05";
  };
    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;

    programs.emacs = {
      enable = true;
      extraPackages = epkgs: [
        epkgs.nix-mode
        epkgs.magit
      ];
    };

    services.gpg-agent = {
      enable = true;
      defaultCacheTtl = 1800;
      enableSshSupport = true;
    };

    nixpkgs.config.allowUnfree = true;


}
