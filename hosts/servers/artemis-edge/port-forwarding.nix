{ domain, tailnet, servers, ... }: {

  boot.kernel.sysctl = {
    "net.ipv4.ip_forward" = 1;
    "net.ipv4.conf.all.rp_filter" = 0;
    "net.ipv4.conf.default.rp_filter" = 0;
  };

	networking = {
		nat = {
			enable = true;
			externalInterface = "eth0";
			internalInterfaces = [ "tailscale0" ];
			forwardPorts = [
				{
					destination = "${servers.achilles.ip}:25565";
					proto = "tcp";
					sourcePort = 25565;
				}
				{
					destination = "${servers.achilles.ip}:25565";
					proto = "udp";
					sourcePort = 25565;
				}
				{
					destination = "${servers.achilles.ip}:19132";
					proto = "tcp";
					sourcePort = 19132;
				}
				{
					destination = "${servers.achilles.ip}:19132";
					proto = "udp";
					sourcePort = 19132;
				}
				{
					destination = "${servers.achilles.ip}:7777";
					proto = "tcp";
					sourcePort = 7777;
				}
				{
					destination = "${servers.achilles.ip}:7777";
					proto = "udp";
					sourcePort = 7777;
				}
				{
					destination = "${servers.achilles.ip}:7878";
					proto = "tcp";
					sourcePort = 7878;
				}
				{
					destination = "${servers.achilles.ip}:7878";
					proto = "udp";
					sourcePort = 7878;
				}
			];
		};

		nftables = {
			enable = true;
			ruleset = ''
				table ip nat {
					chain POSTROUTING {
						type nat hook postrouting priority srcnat; policy accept;
						masquerade;
					}
				}
			'';
		};
  };

  networking.firewall = {
		enable = true;
		allowedTCPPorts = [ 22 443 80 25565 19132 7777 ];
		allowedUDPPorts = [ 22        25565 19132 7777 ];
  };

}
