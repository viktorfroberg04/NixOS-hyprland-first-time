# fastfetch.nix - Bordered configuration for fastfetch
{ config, pkgs, ... }:

{
  programs.fastfetch = {
    enable = true;
    settings = {
      # Logo configuration
      logo = {
        padding = {
          top = 2;
          left = 1;
          right = 2;
        };
      };

      # Display configuration
      display = {
        separator = "  ";
      };

      # Modules configuration
      modules = [
        # Title
        {
          type = "title";
          format = "{#1}╭───────────── {#}{user-name-colored}";
        }
        
        # System Information
        {
          type = "custom";
          format = "{#1}│ {#}System Information";
        }
        {
          type = "os";
          key = "{#separator}│  {#keys}󰍹 OS";
        }
        {
          type = "kernel";
          key = "{#separator}│  {#keys}󰒋 Kernel";
        }
        {
          type = "uptime";
          key = "{#separator}│  {#keys}󰅐 Uptime";
        }
        {
          type = "packages";
          key = "{#separator}│  {#keys}󰏖 Packages";
          format = "{all} (nixpkgs)";
        }
        {
          type = "custom";
          format = "{#1}│";
        }
        
        # Desktop Environment
        {
          type = "custom";
          format = "{#1}│ {#}Desktop Environment";
        }
        {
          type = "de";
          key = "{#separator}│  {#keys}󰧨 DE";
        }
        {
          type = "wm";
          key = "{#separator}│  {#keys}󱂬 WM";
        }
        {
          type = "wmtheme";
          key = "{#separator}│  {#keys}󰉼 Theme";
        }
        {
          type = "display";
          key = "{#separator}│  {#keys}󰹑 Resolution";
        }
        {
          type = "shell";
          key = "{#separator}│  {#keys}󰞷 Shell";
        }
        {
          type = "terminalfont";
          key = "{#separator}│  {#keys}󰛖 Font";
        }
        {
          type = "custom";
          format = "{#1}│";
        }
        
        # Hardware Information
        {
          type = "custom";
          format = "{#1}│ {#}Hardware Information";
        }
        {
          type = "cpu";
          key = "{#separator}│  {#keys}󰻠 CPU";
        }
        {
          type = "gpu";
          key = "{#separator}│  {#keys}󰢮 GPU";
        }
        {
          type = "memory";
          key = "{#separator}│  {#keys}󰍛 Memory";
        }
        {
          type = "disk";
          key = "{#separator}│  {#keys}󰋊 Disk (/)";
          folders = "/";
        }
        {
          type = "custom";
          format = "{#1}│";
        }
        
        # Colors
        {
          type = "colors";
          key = "{#separator}│";
          symbol = "circle";
        }
        
        # Footer
        {
          type = "custom";
          format = "{#1}╰───────────────────────────────╯";
        }
      ];
    };
  };
}