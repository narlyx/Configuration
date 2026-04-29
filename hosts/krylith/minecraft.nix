{
  virtualisation.oci-containers.containers.minecraft = {
    image = "itzg/minecraft-server";
    ports = [ "25565:25565/tcp" "19132:19132/udp" ];
    volumes = [ "/mnt/data/appdata/minecraft:/data" ];
    environment = {
      EULA = "true";
      TYPE = "paper";
      MODRINTH_LOADER = "paper";
      MODRINTH_ALLOWED_VERSION_TYPE = "beta";
      MODRINTH_PROJECTS = "geyser-and-floodgate-auto-uploader";

      ENFORCE_SECURE_PROFILE = "false";
      MOTD = "The freak zone :tounge:";
      MODE = "survival";
      DIFFICULTY = "normal";
      OPS = "B_unno";
      ENFORCE_WHITELIST = "true";
      WHITELIST = ''
                B_unno,
                00000000-0000-0000-0009-01ffddc2c1b5,
                00000000-0000-0000-0009-01fe2c5384da,
                00000000-0000-0000-0009-01f896c95dcd,
                00000000-0000-0000-0009-01f5690b09d8
      '';
    };
  };
}
