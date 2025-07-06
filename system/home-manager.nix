{ inputs, catppuccin, ... }: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "hm-backup";
    extraSpecialArgs = { 
      inherit inputs; 
      inherit catppuccin;
    };
  };
}
