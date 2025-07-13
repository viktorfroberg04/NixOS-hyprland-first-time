{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    mako
    libnotify
  ];

  # Script to create symlink and reload mako
  home.file.".local/bin/mako-pywal-setup" = {
    text = ''
      #!/bin/bash
      MAKO_CONFIG_DIR="$HOME/.config/mako"
      MAKO_CONFIG="$MAKO_CONFIG_DIR/config"
      WAL_CONFIG="$HOME/.cache/wal/mako"
      
      # Create config directory
      mkdir -p "$MAKO_CONFIG_DIR"
      
      # Remove existing config if it exists
      rm -f "$MAKO_CONFIG"
      
      # Create symlink if pywal config exists
      if [ -f "$WAL_CONFIG" ]; then
        ln -sf "$WAL_CONFIG" "$MAKO_CONFIG"
        echo "Symlinked mako config to pywal cache"
        
        # Reload mako if running
        if pgrep mako >/dev/null; then
          makoctl reload
          echo "Mako reloaded"
        fi
      else
        echo "Pywal mako config not found. Run 'wal -i /path/to/wallpaper' first"
      fi
    '';
    executable = true;
  };

}