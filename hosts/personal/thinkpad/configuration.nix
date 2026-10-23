{ inputs, nixModules, homeModules, pkgs, ... }: {

  imports = [

    ./hardware-configuration.nix

    "${inputs.nixos-hardware}/lenovo/thinkpad/t480"

    nixModules.roles.desktop
    nixModules.features.virtualisation

  ];

  system.stateVersion = "25.11";

}

