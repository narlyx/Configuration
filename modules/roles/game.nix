{ inputs, modules, pkgs, ... }: let

  user = "gamer";
  
in {

  imports = [
    modules.roles.server
    inputs.jovian.nixosModules.default
  ];

  boot.kernelParams = [ "amd_pstate=activate" ];
  hardware.xone.enable = true;

  jovian = {
    steam = {
      enable = true;
      autoStart = true;
      user = "${user}";
    };
    hardware.has.amd.gpu = true;
  };

  environment.systemPackages = with pkgs; [
    cmake
    steam-rom-manager
  ];

  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
    };
    autoLogin = {
      enable = true;
      user = "${user}";
    };
    defaultSession = "gamescope-wayland";
  };

  programs.gamemode = {
    enable = true;
    settings = {
      general = {
        renice = 10;
      };
      gpu = {
        apply_gpu_optimisations = "accept-responsibility";
        gpu_device = 0;
        amd_performance_level = "high";
      };
    };
  };

  programs.steam = {
    enable = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  users = {
    groups.${user} = {
      name = "${user}";
      gid = 10000;
    };
    users.${user} = {
      description = "${user}";
      extraGroups = [ "gamemode" "networkmanager" ];
      group = "${user}";
      home = "/home/${user}";
      isNormalUser = true;
      uid = 10000;
    };
  };

}
