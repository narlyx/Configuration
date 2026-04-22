{ modules, pkgs, ... }: {

  imports = [
    ./hardware-configuration.nix
    modules.roles.server
    ./terraria.nix
  ];

  # NAS
  fileSYstems."/mnt/data" = {
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

  # Docker backend
  virtualisation.oci-containers.backend = "docker";

}
