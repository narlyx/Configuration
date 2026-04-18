{ modules, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./graphics.nix
    modules.roles.desktop
    modules.features.virtualisation
    modules.features.narlyx.creative
  ];

  services.flatpak.enable = true;
  programs.steam.enable = true;
  home-manager.users.narlyx.home.packages = with pkgs; [
    prismlauncher
  ];
}
