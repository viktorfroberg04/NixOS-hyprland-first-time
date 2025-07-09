{ config, lib, ... }: {
  imports = [ ];
  config.var = {
    hostname = "nixos";
    username = "Viktor";
    
    keyboardLayout = "sv-latin1";

    location = "Stockholm";
    timeZone = "Europe/Stockholm";
    defaultLocale = "en_US.UTF-8";
    extraLocale = "sv_SE.UTF-8 ";
    extraLocaleSettings = {
      LC_ADDRESS = "sv_SE.UTF-8";
      LC_IDENTIFICATION = "sv_SE.UTF-8";
      LC_MEASUREMENT = "sv_SE.UTF-8";
      LC_MONETARY = "sv_SE.UTF-8";
      LC_NAME = "sv_SE.UTF-8";
      LC_NUMERIC = "sv_SE.UTF-8";
      LC_PAPER = "sv_SE.UTF-8";
      LC_TELEPHONE = "sv_SE.UTF-8";
      LC_TIME = "sv_SE.UTF-8";
    };

    autoUpgrade = false;
    autoGarbageCollector = true;

  };

  options = {
    var = lib.mkOption {
      type = lib.types.attrs;
      default = {};
    };
  };
}
