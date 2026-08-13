{ inputs, homeModules, pkgs, ... }: {

  imports = [
    homeModules.narlyx.ghostty
  ];

  home.packages = with pkgs; [

    # librewolf
    inputs.helium.packages.${pkgs.system}.default
    libreoffice
    gimp
    glabels-qt
    krita
    inkscape
    inkcut
    davinci-resolve
    obs-studio
    ardour
    handbrake
    audacity
    rawtherapee
    shotwell
    gnucash

    mat2

    spotify
    discord

  ];

  xdg.desktopEntries = {
    inkcut = {
      name = "Inkcut";
      genericName = "Inkcut";
      comment = "Open-source 2D plotting software";
      exec = "inkcut";
      icon = "inkcut";
      terminal = false;
      categories = [ "Graphics" "Office" ];
      mimeType = [ "image/svg+xml" ];
      settings = {
      Keywords = "plotter;cutter;vinyl;cnc;2D;";
      };
    };
  };

}
