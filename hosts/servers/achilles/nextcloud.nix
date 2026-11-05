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
    extraApps = {
      inherit (config.services.nextcloud.package.packages.apps) user_oidc;

      paperless_sync = pkgs.fetchNextcloudApp {
        url = "https://github.com/Dennis-Otto/paperless-sync/releases/download/v1.5.0/paperless_sync.tar.gz";
        hash = "sha256-QjfmnmA7cdnePI9Y8q2OCA0lUAsiwjfcartwkMk9r7A=";
        license = "agpl3Only";
      };

      integration_immich = pkgs.fetchNextcloudApp {
        url = "https://github.com/xXRoxXeRXx/integration_immich/releases/download/v1.6.0/integration_immich.tar.gz";
        hash = "sha256-qDkrfwSd7YNG+uq8UMkvwBg7WI4Z8kkveLqSt9tASDE=";
        license = "agpl3Only";
      };

    };
    configureRedis = true;
    config = {
      dbtype = "sqlite";
    };
  };
}
