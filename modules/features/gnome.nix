{ modules, pkgs, ... }: {

  imports = [
    modules.features.narlyx.gnome
  ];

  # Enable gnome
  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  # XDG portal
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
  };
  environment.extraInit = ''
    export XDG_DATA_DIRS="$XDG_DATA_DIRS:${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}"
  '';

  # Audio
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Printing
  services = {
    printing = {
      enable = true;
      drivers = [ pkgs.hplip ];
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };

  # Disable default gnome apps
  services.gnome = {
    core-developer-tools.enable = false;
    games.enable = false;
  };
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-user-docs
    cheese
    epiphany
    gedit
    yelp
    evince
    geary
    seahorse
    papers
    snapshot
    gnome-calculator
    gnome-clocks
    gnome-calendar
    gnome-contacts
    gnome-font-viewer
    gnome-logs
    gnome-maps
    gnome-music
    gnome-weather
    gnome-photos
    gnome-terminal
    gnome-text-editor
    gnome-connections
    # daobab
    # decibels
    # eog
    # simple-scan
    # totem
    # gnome-disk-utility
  ];

  # Extenstions
  environment.systemPackages = with pkgs.gnomeExtensions; [
    blur-my-shell
    appindicator
    caffeine
    mpris-label
  ];

}
