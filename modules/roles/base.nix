# This file defines default configurations for ALL hosts
{ modules, pkgs, ... }: {

  imports = [];

  # Included packages
  environment.systemPackages = with pkgs; [
    git
    vim
    tree
  ];

  # Locale
  time.timeZone = "America/Boise";
  i18n.defaultLocale = "en_US.UTF-8";

  # Networking
  networking.networkmanager.enable = true;

  # UEFI bootloader
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
    };
    efi.canTouchEfiVariables = true;
  };

  # NixOS version
  system.stateVersion = "26.05";

}
