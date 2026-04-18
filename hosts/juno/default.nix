{ modules, inputs, pkgs, ... }: {

  imports = [
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t480
    modules.roles.desktop
    modules.features.virtualisation
  ];

  home-manager.users.narlyx.home.packages = with pkgs; [
    zellij
  ];

}

