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

  hardware.opentabletdriver.enable = true; hardware.uinput.enable = true;
  boot.kernelModules = [ "uinput" "uinput" "i915" "i2c-dev"];
  boot.kernelParams = [ "i915.enable_psr=0" ];
  boot.kernelPackages = pkgs.linuxPackages_latest;
  services.upower.enable = true;
  hardware.enableRedistributableFirmware = true;

  systemd.services.tas2781 = {
    description = "Configure TAS2781 speaker amplifiers";
    wantedBy = [ "multi-user.target" "sleep.target" ];
    after = [
      "systemd-modules-load.service"
      "sound.target"
      "multi-user.target"
      "suspend.target"
      "hibernate.target"
      "hybrid-sleep.target"
      "suspend-then-hibernate.target"
    ];
    path = [ pkgs.i2c-tools pkgs.coreutils pkgs.kmod ];
    serviceConfig = {
      Type = "oneshot";
      User = "root";
      ExecStart = "${pkgs.bash}/bin/bash ${./sound-fix.sh}";
      Restart = "on-failure";
      RestartSec = "2s";
    };
  };


  system.stateVersion = "25.11";

}

