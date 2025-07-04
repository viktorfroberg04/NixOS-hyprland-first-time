{ config, pkgs, ... }: {
  imports = [
    ./variables.nix
  ];
  

  # Define the time zone
  time.timeZone = config.var.timeZone;

  # Set the system's locale (language and encoding)
  i18n.defaultLocale = config.var.defaultLocale;
  i18n.extraLocaleSettings = config.var.extraLocaleSettings;

  # Keyboardlayout
  console.keyMap = config.var.keyboardLayout;
}
