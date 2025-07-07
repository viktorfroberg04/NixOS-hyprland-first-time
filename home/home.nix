{ config, pkgs,  catppuccin, ... }: {

  imports = [
    # Add Catppuccin Home Manager module
    # catppuccin.homeManagerModules.catppuccin
    # catppuccin.homeModules.catppuccin

    # User config
    ../system/variables.nix

    # Programs
    ./kitty.nix
    ./vscode

    # System
    ./hyprland-conf.nix
    ./hyprpaper
    ./catppuccin
  ];
    
  home = {
    inherit (config.var) username;
    homeDirectory = "/home/" + config.var.username;

    
    # Packages that should be installed to the user profile.
    packages = with pkgs; [
      #Apps
      librewolf
      inkscape
      gimp
      firefox
      pywal
      imagemagick
      thunderbird
      rofi
      

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

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Programs should be at the top level, not inside home
  programs = {
    # Let Home Manager install and manage itself
    home-manager.enable = true;
   
    rofi.enable = true;

    # Emacs configuration
    emacs = {
      enable = true;
      extraPackages = epkgs: [
        epkgs.nix-mode
        epkgs.magit
      ];
    };   
  };

  # Services should be at the top level
  services = {
    gpg-agent = {
      enable = true;
      defaultCacheTtl = 1800;
      enableSshSupport = true;
    };
  };

}
