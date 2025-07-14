{ config, pkgs, ... }: {

  imports = [
    # User config
    ../system/variables.nix

    # Programs
    ./kitty.nix
    ./vscode
    ./rofi
    ./fastfetch
    ./btop
    ./ranger
    ./waypaper
    ./cava

    # System
    ./hyprland-conf.nix
    ./hyprlock.nix
    ./hypridle.nix
    ./gtk.nix
    ./hyprpaper
    ./wlogout
    ./mako
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
      nautilus
      
      # Dev
      python3
    ];
   
    # Pywal color template
    file = {

      # Hyprland color template
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
   
      # Waybar color template   
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

      # Rofi color template
      ".config/wal/templates/colors-rofi-dark.rasi" = {
        text = ''
          * {{
              background: rgba({color0.rgb}, 0.90);
              foreground: {color15};
              active-background: rgba({color3.rgb}, 0.90);
              urgent-background: {color1};
              selected-background: {color2};
              normal-background: rgba({color0.rgb}, 0.90);
              normal-foreground: {color15};
              alternate-background: rgba({color0.rgb}, 0.90);
              alternate-foreground: {color15};
              urgent-foreground: {color15};
              active-foreground: {color15};
              selected-normal-background: {color2};
              selected-normal-foreground: {color15};
              selected-urgent-background: {color1};
              selected-urgent-foreground: {color15};
              selected-active-background: {color3};
              selected-active-foreground: {color15};
              alternate-normal-background: rgba({color0.rgb}, 0.90);
              alternate-normal-foreground: {color15};
              alternate-urgent-background: rgba({color0.rgb}, 0.90);
              alternate-urgent-foreground: {color15};
              alternate-active-background: rgba({color0.rgb}, 0.90);
              alternate-active-foreground: {color15};
              border-color: {color0};
              spacing: 2;
          }}
        '';
      };

      # Wlogout color template
      ".config/wal/templates/colors-wlogout.css" = {
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

      # Mako template
      ".config/wal/templates/mako" = {
        text = ''
          background-color={background}E6
          text-color={foreground}
          border-color={color4}
          border-size=2
          border-radius=5
          padding=10
          default-timeout=5000
          width=300
          height=100
          margin=10
          icons=true
          max-icon-size=48
          anchor=top-right

          [urgency=low]
          background-color={background}E6
          text-color={color7}

          [urgency=normal]
          background-color={background}E6
          text-color={color15}

          [urgency=high]
          background-color={color1}E6
          text-color={color15}
        '';
      };

      # Cava Pywal Template
      ".config/wal/templates/colors-cava" = {
        text = ''
          ## Configuration file for CAVA. Default values are commented out. Use either ';' or '#' for commenting.

          [general]
          ; mode = normal
          ; framerate = 60
          ; autosens = 1
          ; overshoot = 20
          ; sensitivity = 100
          ; bars = 0
          ; bar_width = 2
          ; bar_spacing = 1
          ; lower_cutoff_freq = 50
          ; higher_cutoff_freq = 10000
          ; sleep_timer = 0

          [input]
          method = pulse
          source = auto

          [output]
          ; method = ncurses
          ; channels = stereo
          ; mono_option = average
          ; raw_target = /dev/stdout
          ; data_format = binary
          ; bit_format = 16bit
          ; ascii_max_range = 1000
          ; bar_delimiter = 59
          ; frame_delimiter = 10
          ; sdl_width = 1000
          ; sdl_height = 500
          ; sdl_x = -1
          ; sdl_y = -1

          [color]
          gradient = 1
          gradient_color_1 = '{color0}'
          gradient_color_2 = '{color2}'
          gradient_color_3 = '{color3}'
          gradient_color_4 = '{color5}'
          gradient_color_5 = '{color7}'
          gradient_color_6 = '{color12}'
          gradient_color_7 = '{color13}'
          gradient_color_8 = '{color15}'

          [smoothing]
          ; integral = 77
          ; monstercat = 1
          ; waves = 1
          ; gravity = 90
          ; ignore = 0

          [eq]
          ; 1 = 1 # bass
          ; 2 = 1
          ; 3 = 1 # midtone
          ; 4 = 1
          ; 5 = 1 # treble
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
