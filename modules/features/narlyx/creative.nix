{ pkgs, ... }: {
  home-manager.users.narlyx.home.packages = with pkgs; [
    inkscape
    gimp
    krita
    glabels-qt
    davinci-resolve
    ardour
    prusa-slicer
  ];
}
