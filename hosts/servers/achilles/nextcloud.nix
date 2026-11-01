{ modules, config, pkgs, servers, domain, ... }: {
  services.nextcloud = {
    enable = true;
    home = "/mnt/data/nextcloud";
    package = pkgs.nextcloud35;
    hostName = "0.0.0.0";
    https = true;
    settings.trusted_domains = [
      servers.services.ip
      servers.services.hostname
      "harbor.${domain}"
    ];
    extraAppsEnable = true;
    # extraApps = {
    #  inherit (config.services.nextcloud.package.packages.apps) paperless_sync integration_immich; };
    configureRedis = true;
    config = {
      dbtype = "sqlite";
    };
  };
}
