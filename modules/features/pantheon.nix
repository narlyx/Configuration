{ nixModules, homeModules, pkgs, ... }: {

  imports = [
    nixModules.features.appimage
  ];
  home-manager.users.narlyx.imports = [ homeModules.narlyx.pantheon ];

  services.xserver.enable = true;
  services.desktopManager.pantheon.enable = true;

  services.pantheon.apps.enable = false;
  environment.systemPackages = with pkgs.pantheon; [
    elementary-calculator
    elementary-calendar
    elementary-files
    elementary-mail
    elementary-music
    elementary-photos
    elementary-screenshot
    elementary-tasks
    elementary-videos
    elementary-wallpapers
  ];

}
