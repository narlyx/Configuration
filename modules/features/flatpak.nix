{ inputs, pkgs, ... }: {
  services.flatpak = {
    enable = true;
    package = inputs.nixpkgs-flatpak.legacyPackages.${pkgs.system}.flatpak; # tmp bug fix
  };
}
