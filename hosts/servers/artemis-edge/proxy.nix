{ domain, tailnet, servers, ... }: {
  services.caddy = {
    enable = true;
    virtualHosts = {

      "https://mesh.${domain}" = {
        extraConfig = "reverse_proxy * http://localhost:8080";
      };

      "https://auth.${domain}" = {
        extraConfig = "reverse_proxy * http://localhost:1411";
      };


      "https://headscale.${domain}" = {
        extraConfig = "reverse_proxy * http://localhost:8080";
      };

      "https://${domain}/nextcloud" = {
        extraConfig = "reverse_proxy * http://${servers.achilles.hostname}:80";
      };

    };
  };
}
