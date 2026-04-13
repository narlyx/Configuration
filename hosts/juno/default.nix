{ modules, inputs, pkgs, ... }: {

  imports = [
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t480
    modules.roles.desktop
    modules.features.virtualisation
  ];

  environment.systemPackages = with pkgs; [
    zellij
  ];

}

