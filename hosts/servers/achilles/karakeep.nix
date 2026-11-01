{ config, secretFiles, domain, ... }: {
  age.secrets.karakeep-env.file = secretFiles.karakeep-env;
  services.karakeep = {
    enable = true;
    environmentFile = config.age.secrets.karakeep-env.path;
    extraEnvironment = {
      PORT = "3000";
      DISABLE_SIGNUPS = "true";
      DISABLE_NEW_RELEASE_CHECK = "true";
      DISABLE_PASSWORD_AUTH = "true";
      OAUTH_ALLOW_DANGEROUS_EMAIL_ACCOUNT_LINKING = "true";
      OAUTH_WELLKNOWN_URL = "https://keyring.${domain}/.well-known/openid-configuration";
      OAUTH_PROVIDER_NAME = "Pocket ID";
      NEXTAUTH_URL = "https://pocket.${domain}";
    };
  };
}
