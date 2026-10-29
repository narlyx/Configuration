{ inputs, nixModules, homeModules, pkgs, lib, ... }: {

  ### IMPORTS ###
  imports = [
    inputs.home-manager.nixosModules.default
    inputs.agenix.nixosModules.default
    nixModules.features.vim
    nixModules.users.root
    nixModules.features.nh
  ];

  ### BOOTLOADER ###
  boot.loader = {
    systemd-boot = {
      enable = lib.mkDefault true;
      configurationLimit = lib.mkDefault 3;
    };
    timeout = lib.mkDefault 0;
    efi.canTouchEfiVariables = lib.mkDefault true;
  };
  boot.loader.grub.enable = lib.mkDefault false;

  ### NIX ###
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  ### HOME ###
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inputs = inputs;
      homeModules = homeModules;
    };
    backupFileExtension = "bak";
  };

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
