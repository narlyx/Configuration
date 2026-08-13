{ inputs, nixModules, homeModules, pkgs, ... }: {

  imports = [
    ./hardware-configuration.nix

    "${inputs.nixos-hardware}/common/cpu/intel/lunar-lake"
    "${inputs.nixos-hardware}/common/pc/laptop"
    "${inputs.nixos-hardware}/common/pc/ssd"
    "${inputs.nixos-hardware}/asus/battery.nix"

    nixModules.roles.desktop
    nixModules.features.flatpak
  ];

  environment.sessionVariables = {
    QT_SCALE_FACTOR = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "0";
    GDK_SCALE = "1";
    GDK_DPI_SCALE = "1";
    NIXOS_OZONE_WL = "1";
  };

  hardware.opentabletdriver.enable = true;
  hardware.uinput.enable = true;
  boot.kernelModules = [ "uinput" "i915" ];
  boot.kernelParams = [ "i915.enable_psr=0" ];
  boot.kernelPackages = pkgs.linuxPackages_latest;
  services.upower.enable = true;
  hardware.enableRedistributableFirmware = true;

  system.stateVersion = "25.11";

}

