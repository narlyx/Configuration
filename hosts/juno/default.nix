{ modules, inputs, pkgs, ... }: {

  imports = [
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t480
    modules.roles.desktop
  ];

  environment.systemPackages = with pkgs; [
    zellij
  ];

}

