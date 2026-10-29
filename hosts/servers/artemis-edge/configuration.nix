{ lib, pkgs, ... }: let

  domain = "narlyx.net";
  tailnet = "narlyx.tailnet";

in {

  _module.args = {

    inherit domain tailnet;

    servers = {

      achilles = {
        ip = "100.64.0.12";
        hostname = "achilles.${tailnet}";
      };

      apollo = {
        ip = "";
        hostname = "apollo.${tailnet}";
      };

      artemis = {
        ip = "";
        hostname = "artemis.${tailnet}";
      };

      athena = {
        ip = "";
        hostname = "athena.${tailnet}";
      };

      hades = {
        ip = "";
        hostname = "hades.${tailnet}";
      };

    };

  };

  imports = [
    ./hardware-configuration.nix
    ./port-forwarding.nix 
    ./mesh.nix
    ./proxy.nix
    ./auth.nix
  ];

  boot.loader.systemd-boot.enable = false;
  boot.loader.grub = {
    enable = true;
    device = "/dev/vda";
    efiSupport = false;
    efiInstallAsRemovable = false;
  };

  networking = {
    nameservers = [ "8.8.8.8" ];
    defaultGateway = "137.184.32.1";
    dhcpcd.enable = false;
    usePredictableInterfaceNames = lib.mkForce false;
    interfaces = {
      eth0 = {
        ipv4.addresses = [
          { address="137.184.40.17"; prefixLength=20; }
          { address="10.48.0.6"; prefixLength=16; }
        ];
        ipv4.routes = [ { address = "137.184.32.1"; prefixLength = 32; } ];
      };
      eth1 = {
        ipv4.addresses = [
          { address="10.124.0.3"; prefixLength=20; }
        ];
      };
    };
  };
  services.udev.extraRules = ''
    ATTR{address}=="ee:6f:7e:4f:d7:69", NAME="eth0"
    ATTR{address}=="1a:0c:b2:95:22:34", NAME="eth1"
  '';

  system.stateVersion = "25.11";

}
