{ inputs, nixModules, homeModules, pkgs, lib, ... }: {

  ### IMPORTS ###
  imports = [
    inputs.home-manager.nixosModules.default
    inputs.agenix.nixosModules.default
    nixModules.features.vim
    nixModules.users.root
    homeModules.all-users
    nixModules.features.nh
  ];

  ### BOOTLOADER ###
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 3;
    };
    timeout = 0;
    efi.canTouchEfiVariables = true;
  };

  ### NIX ###
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  ### NETWORK ###
  networking.networkmanager.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false;

  ### REMOTE ACCESS ###
  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "prohibit-password";
  };

  ### LOCALE ###
  time.timeZone = "America/Boise";
  i18n.defaultLocale = "en_US.UTF-8";

  ### INCLUDED PACKAGES ###
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = [
    inputs.agenix.packages.${pkgs.stdenv.hostPlatform.system}.default
    pkgs.git
    pkgs.vim
    pkgs.tree
    pkgs.progress
  ];
  programs.nano.enable = false;
  environment.variables.EDITOR = "vim";

}
