{ modules, config, ... }: {

  # Home manager
  home-manager.users.root = {
    home = {
      username = "root";
      homeDirectory = "/root";
      stateVersion = config.system.stateVersion;
    };
  };

}

