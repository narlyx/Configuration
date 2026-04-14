{ modules, pkgs, ... }: {

  imports = [
    modules.features.narlyx.librewolf
    modules.features.narlyx.ghostty
  ];

  home-manager.users.narlyx = {

    home.packages = with pkgs; [
      onlyoffice-desktopeditors
      thunderbird
      joplin-desktop
      nextcloud-client
      gradia
      bitwarden-desktop
      spotify
      discord
    ];

    dconf = {
      enable = true;
      settings = {
        "org/gnome/shell" = {
          enabled-extensions = with pkgs.gnomeExtensions; [
            blur-my-shell.extensionUuid
            appindicator.extensionUuid
            panel-corners.extensionUuid
            caffeine.extensionUuid
            mpris-label.extensionUuid
          ];
        };
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
          accent-color = "blue";
          clock-format = "12h";
        };
      };
    };

  };

}
