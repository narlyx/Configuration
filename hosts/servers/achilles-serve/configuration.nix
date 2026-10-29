{ modules, pkgs, ... }: {

  imports = [

    ./hardware-configuration.nix
    ./terraria.nix
    # ./nextcloud.nix
    ./minecraft.nix

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

  virtualisation.oci-containers.backend = "docker";

  system.stateVersion = "25.11";

}
