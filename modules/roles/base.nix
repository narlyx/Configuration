# This file defines default configurations for ALL hosts
{ modules, inputs, pkgs, ... }: {

  imports = [
    inputs.home-manager.nixosModules.default
    inputs.agenix.nixosModules.default
    modules.features.vim
    modules.users.root
  ];

  # Default text editor
  environment.variables.EDITOR = "vim";

  # Included packages
  environment.systemPackages = [
    inputs.agenix.packages.${pkgs.stdenv.hostPlatform.system}.default
    pkgs.git
    pkgs.tree
  ];

  # Unfree pakages
  nixpkgs.config.allowUnfree = true;

  # Locale
  time.timeZone = "America/Boise";
  i18n.defaultLocale = "en_US.UTF-8";

  # Networking
  networking.networkmanager.enable = true;

  # UEFI bootloader
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
    efiInstallAsRemovable = true;
  };

  # Open SSH
  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "prohibit-password";
  };

  # NixOS version
  system.stateVersion = "26.05";

}
