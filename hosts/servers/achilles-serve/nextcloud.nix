{ modules, config, pkgs, ... }: {
  imports = [ modules.secrets.nextcloud-admin-pass ];
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud32;
    home = "/mnt/data/nextcloud";

    hostName = "0.0.0.0";
    https = true;
    settings.trusted_domains = [ "100.64.0.12" "achilles-serve" "achilles-serve.narlyx.tailnet" "narlyx.net/nextcloud" ];

    extraAppsEnable = true;
    extraApps = { inherit (pkgs.nextcloud32Packages.apps) onlyoffice; };
    configureRedis = true;
    config = {
      dbtype = "sqlite";
      adminuser = "admin";
      adminpassFile = config.age.secrets.nextcloud-admin-pass.path;
    };
  };
}
