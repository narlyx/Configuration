{ nixModules, pkgs, ... }: {

  imports = [
    nixModules.users.narlyx
    nixModules.features.pantheon
    nixModules.features.printing
    nixModules.features.appimage
  ];

}
