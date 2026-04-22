# This file defines default configurations for ALL hosts
{ modules, inputs, pkgs, lib, ... }: {

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

  # Trusted users
  nix.settings.trusted-users = [ "root" "narlyx" ];

  # Experimental features
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Locale
  time.timeZone = "America/Boise";
  i18n.defaultLocale = "en_US.UTF-8";

  # Networking
  networking.networkmanager.enable = true;

  # UEFI bootloader
  boot.loader.grub = {
    enable = lib.mkDefault true;
    device = lib.mkDefault "nodev";
    efiSupport = lib.mkDefault true;
    efiInstallAsRemovable = lib.mkDefault true;
  };

  # Open SSH
  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "prohibit-password";
  };

  # Tailscale
  services.tailscale.enable = true;

  # NixOS version
  system.stateVersion = "26.05";

}
