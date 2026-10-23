{ inputs, nixModules, homeModules, pkgs, ... }: {

  imports = [
    ./hardware-configuration.nix
    ./graphics.nix
  ];

  system.stateVersion = "25.11";
  
} 
