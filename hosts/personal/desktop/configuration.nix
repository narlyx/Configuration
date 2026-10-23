{ inputs, nixModules, homeModules, pkgs, ... }: {

  imports = [
    ./hardware-configuration.nix
    ./graphics.nix
    nixModules.roles.desktop
    nixModules.features.flatpak
  ];

  system.stateVersion = "25.11";
  
} 
