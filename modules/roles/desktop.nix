{ nixModules, pkgs, ... }: {

  imports = [
    nixModules.users.narlyx
    nixModules.features.pantheon
  ];

}
