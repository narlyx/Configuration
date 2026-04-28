{ modules, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./graphics.nix
    modules.roles.game
  ];
}
