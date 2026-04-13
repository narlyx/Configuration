{ modules, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./graphics.nix
    modules.roles.desktop
    modules.features.virtualisation
  ];

  services.flatpak.enable = true;
  programs.steam.enable = true;
  home-manager.users.narlyx.home.packages = with pkgs; [
    prismlauncher
    krita
    gimp
    ardour
    inkscape
    prusa-slicer
  ];
}
