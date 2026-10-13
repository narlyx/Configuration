{ nixModules, pkgs, ... }: {

  imports = [
    nixModules.users.narlyx
    nixModules.features.kde
    nixModules.features.appimage
    nixModules.features.flatpak
  ];

}
