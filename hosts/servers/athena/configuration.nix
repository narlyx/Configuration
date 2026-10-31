{ pkgs, servers, ... }: {

  imports = [

    ./hardware-configuration.nix

 ];

  fileSystems."/mnt/data" = {
    device = "192.168.0.159:/data";
    fsType = "nfs";
    neededForBoot = false;
    options = [
      "rw"
      "nfsvers=4"
      "_netdev"
      "nofail"
    ];
  };

  system.stateVersion = "25.11";

}
