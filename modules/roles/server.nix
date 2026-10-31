{

  _module.args = let

    domain = "narlyx.net";
    tailnet = "narlyx.tailnet";

  in {

    inherit domain tailnet;

    servers = {

      services = {
        ip = "100.64.0.12";
        hostname = "achilles.${tailnet}";
      };

      media = {
        ip = "";
        hostname = "apollo.${tailnet}";
      };

      gateway = {
        ip = "100.64.0.1";
        hostname = "artemis.${tailnet}";
      };

      hypervisor = {
        ip = "100.64.0.6";
        hostname = "athena.${tailnet}";
      };

      storage = {
        ip = "100.64.0.13";
        hostname = "hades.${tailnet}";
      };

    };

  };

  users.users."root".openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKTun89j+M9wpS4WkXDgUwTgz6cWj8oSl8Qy6TQhXOyt"
  ];

  services.tailscale.enable = true;

}
