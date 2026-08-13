{ pkgs, ... }: {
  home.packages = with pkgs; [
    grim
  ];
  services.flameshot = {
    enable = true;
    settings = {
      General = {
        disabledTrayIcon = true;
        showStartupLaunchMessage = false;
        useGrimAdapter = true;
      };
    };
  };
}
