{ pkgs, ... }: {
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;
  programs.appimage.package = pkgs.appimage-run.override {
    extraPkgs = pkgs: [
      pkgs.webkitgtk_4_1
      pkgs.zstd
      pkgs.ffmpeg
    ]; 
  };
}
