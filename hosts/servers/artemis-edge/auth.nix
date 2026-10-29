{ inputs, config, secretFiles, domain, ... }: {

  imports = [ inputs.pocket-id-nixos.nixosModules.default ];

  age.secrets.pocket-id-key.file = secretFiles.pocket-id-key;
  age.secrets.pocket-id-api.file = secretFiles.pocket-id-api;

  services.pocket-id = {
    enable = true;
    settings.APP_URL = "https://auth.${domain}";
    credentials = {
      ENCRYPTION_KEY = config.age.secrets.pocket-id-key.path;
      STATIC_API_KEY = config.age.secrets.pocket-id-key.path;
    };
  };

  services.pocket-id-auth = {
    enable = true;

    # clients.immich = {
    #   name = "Immich";
    #   redirectUris = [ "https://immich.example.com/auth/login" ];
    #   secretFile = "/run/secrets/grafana/OIDC_CLIENT_SECRET";
    #   customClaims.immich_role = "user"; # → group immich-users, client restricted to it
    # };

    # appConfig = {
    #   smtpHost = "127.0.0.1";
    #   smtpPort = "25";
    #   smtpFrom = "auth@example.com";
    # };

  };

}
