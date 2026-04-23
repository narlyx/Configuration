{ modules, pkgs, ... }: let

  domain = "narlyx.net";
  tailnet = "narlyx.tailnet";
  krylith-ip = "100.64.0.12";
  astrylx-ip = "100.64.0.7";

in {

  # Modules
  imports = [
    ./hardware-configuration.nix
    ./networking.nix
    modules.roles.server
  ];

  # Bootloader
  boot.loader.grub = {
    enable = true;
    device = "/dev/vda";
    efiSupport = false;
    efiInstallAsRemovable = false;
  };

  # Headscale 
  services.headscale = {
    enable = true;
    address = "0.0.0.0";
    port = 8080;
    settings = {
      server_url = "https://headscale.${domain}";
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

  # Proxy
  services.caddy = {
	  enable = true;
	  virtualHosts = {
			"https://headscale.${domain}" = {
			  extraConfig = "reverse_proxy * http://localhost:8080";
			};
			"https://nextcloud.${domain}" = {
			  extraConfig = "reverse_proxy * http://krylith.${tailnet}:80";
			};
			"https://proxmox.${domain}" = {
			  extraConfig = ''
			  	reverse_proxy * {
				    to theta.${tailnet}:8006
				    lb_policy ip_hash
				    lb_try_duration 1s
			  	  lb_try_interval 250ms
				    health_uri /
				    # health_port 80
				    health_interval 10s
				    health_timeout 2s
				    health_status 200
				    transport http {
					    tls_insecure_skip_verify
				    }
				  }
			  '';
			};
		};
	};

	# Port forwarding
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
					destination = "${krylith-ip}:25565";
					proto = "tcp";
					sourcePort = 25565;
				}
				{
					destination = "${krylith-ip}:25565";
					proto = "udp";
					sourcePort = 25565;
				}
				{
					destination = "${krylith-ip}:19132";
					proto = "tcp";
					sourcePort = 19132;
				}
				{
					destination = "${krylith-ip}:19132";
					proto = "udp";
					sourcePort = 19132;
				}
				{
					destination = "${krylith-ip}:7777";
					proto = "tcp";
					sourcePort = 7777;
				}
				{
					destination = "${krylith-ip}:7777";
					proto = "udp";
					sourcePort = 7777;
				}
				{
					destination = "${krylith-ip}:7878";
					proto = "tcp";
					sourcePort = 7878;
				}
				{
					destination = "${krylith-ip}:7878";
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

  # Firewall
  networking.firewall = {
		enable = true;
		allowedTCPPorts = [ 22 443 80 25565 19132 7777 ];
		allowedUDPPorts = [ 22 25565 19132 7777 ];
  };

}
