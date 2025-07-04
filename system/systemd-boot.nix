{ pkgs, lib, ... }: {

  # Bootloader
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    
    # Use latest kernel
    kernelPackages = pkgs.linuxPackages_latest;
  };
}
