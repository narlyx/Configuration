{ modules, config, ... }: {

  imports = [
    modules.features.narlyx.zsh
    modules.features.narlyx.git
    modules.secrets.narlyx-ssh
  ];

  # System user
  users.users.narlyx = {
    isNormalUser = true;
    initialPassword = "changeme";
    extraGroups = [
      "wheel" # Sudo
      "networkmanager" # Networking
    ];
  };

  # Home manager
  home-manager.users.narlyx = {
    home = {
      username = "narlyx";
      homeDirectory = "/home/narlyx";
      stateVersion = config.system.stateVersion;
    };
  };

}

