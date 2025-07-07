{
  description = "My NixOS configuration with pywal theming";
  inputs = {
    # Use the unstable channel for latest packages
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    # Home Manager for user-level configuration
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  outputs = { self, nixpkgs, home-manager }: {
    # Replace 'nixos' with your actual hostname
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";  # Change if you're on ARM
      specialArgs = { 
        inherit self;
      };
      modules = [
        # Your existing configuration files
        ./configuration.nix
      ];
    };

    # Home Manager configuration (standalone)
    homeConfigurations.viktor = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      extraSpecialArgs = { 
      };
      modules = [
        ./home/home.nix
      ];
    };
  };
}
