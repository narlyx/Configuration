{
  virtualisation.oci-containers.containers.terraria = {
    image = "ryshe/terraria:latest";
    ports = [ "7777:7777" "7878:7878" ];
    volumes = [ "/mnt/data/appdata/terraria:/root/.local/share/Terraria/Worlds" ];
    environment = {
      WORLD_FILENAME = "Loot_Lake.wld";
    };
  };
}
