{
  virtualisation.oci-containers.containers.terraria = {
    image = "passivelemon/terraria-docker:terraria-latest";
    ports = [ "7777:7777" ];
    volumes = [ "/mnt/data/appdata/terraria:/opt/terraria/config" ];
  };
}
