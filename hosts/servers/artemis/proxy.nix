{ domain, tailnet, servers, ... }: {
  services.caddy = {
    enable = true;
    virtualHosts = {
      "https://tether.${domain}" = {
        extraConfig = "reverse_proxy * http://localhost:8080";
      };

      "https://auth.${domain}" = {
        extraConfig = "reverse_proxy * http://localhost:1411";
      };

      "https://pocket.${domain}" = {
        extraConfig = "reverse_proxy * http://${servers.services.hostname}:3000";
      };

      "https://headscale.${domain}" = { # TODO: Remove when taking over hisoka
        extraConfig = "reverse_proxy * http://localhost:8080";
      };

      "https://harbor.${domain}" = {
        extraConfig = "reverse_proxy * http://${servers.services.hostname}:80";
      };

      # immich: gallary
      # paperless: records

    };
  };
}
