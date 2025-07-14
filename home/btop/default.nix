{ config, lib, pkgs, ... }:

{
  # Install the theme update script directly as text
  home.file.".local/bin/update-btop-theme.sh" = {
    text = ''
      #!/usr/bin/env bash
      
      # Check if pywal colors exist
      if [ ! -f "$HOME/.cache/wal/colors.sh" ]; then
        echo "Pywal colors not found. Run 'wal -i /path/to/wallpaper' first."
        exit 1
      fi
      
      # Source pywal colors
      source "$HOME/.cache/wal/colors.sh"
      
      # Create btop themes directory
      mkdir -p "$HOME/.config/btop/themes"
      
      # Create simple pywal theme
      cat > "$HOME/.config/btop/themes/pywal.theme" << EOF
      theme[main_bg]=""
      theme[main_fg]="$color7"
      theme[title]="$color6"
      theme[hi_fg]="$color4"
      theme[selected_bg]="$color8"
      theme[selected_fg]="$color7"
      theme[inactive_fg]="$color8"
      theme[graph_text]="$color7"
      theme[meter_bg]="$color8"
      theme[proc_misc]="$color6"
      theme[cpu_box]="$color1"
      theme[mem_box]="$color2"
      theme[net_box]="$color3"
      theme[proc_box]="$color4"
      theme[div_line]="$color8"
      theme[temp_start]="$color2"
      theme[temp_mid]="$color3"
      theme[temp_end]="$color1"
      theme[cpu_start]="$color2"
      theme[cpu_mid]="$color3"
      theme[cpu_end]="$color1"
      theme[free_start]="$color2"
      theme[free_mid]="$color3"
      theme[free_end]="$color1"
      theme[cached_start]="$color2"
      theme[cached_mid]="$color3"
      theme[cached_end]="$color1"
      theme[available_start]="$color2"
      theme[available_mid]="$color3"
      theme[available_end]="$color1"
      theme[used_start]="$color1"
      theme[used_mid]="$color3"
      theme[used_end]="$color2"
      theme[download_start]="$color2"
      theme[download_mid]="$color3"
      theme[download_end]="$color1"
      theme[upload_start]="$color5"
      theme[upload_mid]="$color6"
      theme[upload_end]="$color4"
      theme[process_start]="$color2"
      theme[process_mid]="$color3"
      theme[process_end]="$color1"
      EOF
      
      echo "Btop pywal theme updated!"
    '';
    executable = true;
  };
  
  # Configure btop using the built-in home-manager option
  programs.btop = {
    enable = true;
    
    settings = {
      color_theme = "pywal";
      theme_background = false;
      truecolor = true;
      vim_keys = true;
      rounded_corners = true;
      graph_symbol = "braille";
      shown_boxes = "cpu mem net proc";
      update_ms = 2000;
      proc_sorting = "cpu lazy";
      proc_colors = true;
      proc_gradient = true;
      show_uptime = true;
      show_battery = true;
      show_disks = true;
      show_temp = true;
      clock_format = "%X";
    };
  };
}