{ domain, tailnet, servers, ... }: {
  services.caddy = {
    enable = true;
    virtualHosts = {
      "https://tether.${domain}" = {
        extraConfig = "reverse_proxy * http://localhost:8080";
      };

      "https://keyring.${domain}" = {
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

      "https://gallery.${domain}" = {
        extraConfig = "reverse_proxy * http://${servers.services.hostname}:2283";
      };

      "https://records.${domain}" = {
        extraConfig = "reverse_proxy * http://${servers.services.hostname}:28981";
      };

    };
  };
}
