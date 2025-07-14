{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    waypaper
    hyprpaper
  ];

  # Your wallpaper change script
  home.file.".local/bin/wallpaper-changed" = {
    text = ''
      #!/usr/bin/env bash
      
      current_wallpaper=$(hyprctl hyprpaper listloaded)
      echo "Processing wallpaper change: $current_wallpaper"

      CURRENT_WALL="$HOME/nixos-config/home/current-wp/current-wallpaper.jpg"
      BLURRED_WALL="$HOME/nixos-config/home/current-wp/current-wallpaper-blur.jpg"

      
      # Set wallpaper with hyprpaper
      hyprctl hyprpaper preload "$current_wallpaper"
      hyprctl hyprpaper wallpaper "$current_wallpaper"
      
      # Run pywal to generate color scheme
      wal -i "$current_wallpaper"
      sleep 0.2

      # Update mako config
      if [ -f "$HOME/.cache/wal/mako" ]; then
        mkdir -p "$HOME/.config/mako"
        ln -sf "$HOME/.cache/wal/mako" "$HOME/.config/mako/config"
      fi
      
      # Restart/reload applications
      if pgrep mako >/dev/null; then
        makoctl reload
      fi
      
      if pgrep waybar >/dev/null; then
        pkill waybar
        waybar &
      else
        waybar &  
      fi
      
      if pgrep Hyprland >/dev/null; then
        hyprctl reload
      fi

      # Save original wallpaper
      cp "$current_wallpaper" "$CURRENT_WALL"

      # Create blurred version using ImageMagick
      magick "$current_wallpaper" -blur 50x30 "$BLURRED_WALL"
      
      echo "Theme updated!"
    '';
    executable = true;
  };

  # Alternative: Don't manage the config file with Nix
  # Just ensure the directory exists and let waypaper create its own config
  home.activation.waypaper-setup = ''
    mkdir -p ${config.home.homeDirectory}/.config/waypaper
    # Only create config if it doesn't exist
    if [ ! -f ${config.home.homeDirectory}/.config/waypaper/config.ini ]; then
    cat > ${config.home.homeDirectory}/.config/waypaper/config.ini << 'EOF'
    [Settings]
    language = en
    folder = ${config.home.homeDirectory}/nixos-config/home/wallpapers
    wallpaper = 
    monitors = All
    fill = Fill
    sort = name
    color = #ffffff
    subfolders = False
    number_of_columns = 3
    post_command = ${config.home.homeDirectory}/.local/bin/wallpaper-changed
    EOF
    fi
  '';

}