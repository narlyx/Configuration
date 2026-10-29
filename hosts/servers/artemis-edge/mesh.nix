{ domain, tailnet, ... }: {
  services.headscale = {
    enable = true;
    address = "0.0.0.0";
    port = 8080;
    settings = {
      noise.private_key_path = "/var/lib/headscale/noise_private.key";
      server_url = "https://mesh.${domain}";
      tls_key_path = null;
      tls_cert_path = null;
      dns = {
        base_domain = tailnet;
        magic_dns = true;
        nameservers.global = [
          "1.1.1.1"
          "1.0.0.1"
        ];
      };
    };
  };
}
