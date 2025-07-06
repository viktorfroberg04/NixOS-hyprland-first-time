{ config, pkgs, ... }: {

  imports = [
    # Add Catppuccin Home Manager module
    # catppuccin.homeManagerModules.catppuccin

    # User config
    ../system/variables.nix

    # Programs
    ./kitty.nix

    # System
    ./hyprland-conf.nix
    ./hyprpaper
    # ./catppuccin
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
      imagemagick

      # Dev
      python3
      
    ];
    
    programs = {
      # Kitty terminal (if configured through home manager)
      kitty.catppuccin.enable = true;
  
      # Other common applications
      rofi.catppuccin.enable = true;
      neofetch.catppuccin.enable = true;
      btop.catppuccin.enable = true;
  
      # If you use other applications
      firefox.catppuccin.enable = true;
      git.catppuccin.enable = true;
    };    

    programs.vscode = {
      enable = true;
      extensions = with pkgs.vscode-extensions; [
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons
      ];
      userSettings = {
        "workbench.colorTheme" = "Catppuccin Mocha";
        "workbench.iconTheme" = "catppuccin-mocha";
      };
    };

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


}
