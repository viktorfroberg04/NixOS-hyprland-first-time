{
  description = "My NixOS configuration with Catppuccin theming";
  inputs = {
    # Use the unstable channel for latest packages
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    # Home Manager for user-level configuration
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    # Add Catppuccin theming
    catppuccin.url = "github:catppuccin/nix";
  };
  
  outputs = { self, nixpkgs, home-manager, catppuccin }: {
    # Replace 'nixos' with your actual hostname
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";  # Change if you're on ARM
      specialArgs = { 
        inherit self;
        inherit catppuccin;
      };
      modules = [
        # Your existing configuration files
        ./configuration.nix
        
        # Add Catppuccin module
        catppuccin.nixosModules.catppuccin
      ];
    };

    # Home Manager configuration (standalone)
    homeConfigurations.viktor = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      extraSpecialArgs = { 
        inherit catppuccin;
      };
      modules = [
        ./home/home.nix
        catppuccin.homeModules.catppuccin
      ];
    };
  };
}
