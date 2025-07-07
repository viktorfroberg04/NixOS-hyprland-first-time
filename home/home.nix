{ config, pkgs, ... }: {

  imports = [
    # User config
    ../system/variables.nix

    # Programs
    ./kitty.nix
    ./vscode
    ./rofi

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
      inkscape
      gimp
      firefox
      pywal
      imagemagick
      thunderbird

      # Dev
      python3
      
    ];
   
    # Pywal color template
    file = {
      ".config/wal/templates/colors-hyprland.conf" = {
        text = ''
          $color0 = rgb({color0.strip})
          $color1 = rgb({color1.strip})
          $color2 = rgb({color2.strip})
          $color3 = rgb({color3.strip})
          $color4 = rgb({color4.strip})
          $color5 = rgb({color5.strip})
          $color6 = rgb({color6.strip})
          $color7 = rgb({color7.strip})
          $color8 = rgb({color8.strip})
          $color9 = rgb({color9.strip})
          $color10 = rgb({color10.strip})
          $color11 = rgb({color11.strip})
          $color12 = rgb({color12.strip})
          $color13 = rgb({color13.strip})
          $color14 = rgb({color14.strip})
          $color15 = rgb({color15.strip})
          $foreground = rgb({foreground.strip})
          $background = rgb({background.strip})
        '';
      };
   
      ".config/wal/templates/colors-waybar.css" = {
        text = ''
          @define-color foreground {foreground};
          @define-color background {background};
          @define-color cursor {cursor};

          @define-color color0 {color0};
          @define-color color1 {color1};
          @define-color color2 {color2};
          @define-color color3 {color3};
          @define-color color4 {color4};
          @define-color color5 {color5};
          @define-color color6 {color6};
          @define-color color7 {color7};
          @define-color color8 {color8};
          @define-color color9 {color9};
          @define-color color10 {color10};
          @define-color color11 {color11};
          @define-color color12 {color12};
          @define-color color13 {color13};
          @define-color color14 {color14};
          @define-color color15 {color15};
        '';
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

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Programs should be at the top level, not inside home
  programs = {
    # Let Home Manager install and manage itself
    home-manager.enable = true;

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
