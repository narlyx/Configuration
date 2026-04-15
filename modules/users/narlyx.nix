{ modules, config, ... }: {

  imports = [
    modules.features.narlyx.zsh
    modules.features.narlyx.git
    modules.secrets.narlyx-ssh
    modules.secrets.narlyx-password
  ];

  # System user
  users.users.narlyx = {
    description = "Narlyx";
    isNormalUser = true;
    hashedPasswordFile = config.age.secrets.narlyx-password.path;
    extraGroups = [
      "wheel" # Sudo
      "networkmanager" # Networking
      "vboxusers" # Virtualbox
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

