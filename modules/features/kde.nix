{ pkgs, nixModules, homeModules, ... }: {

  imports = [
    nixModules.features.printing
    nixModules.features.bluetooth
  ];

  home-manager.users.narlyx.imports = [ homeModules.narlyx.kde ];

  services = {
    desktopManager.plasma6.enable = true;
    displayManager.plasma-login-manager.enable = true;
  };

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    konsole
    kate
    ktexteditor
    khelpcenter
    discover
  ];

}
