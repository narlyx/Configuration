{ modules, config, ... }: {

  ### HOME ENV ###
  home-manager.users.root = {
    home = {
      username = "root";
      homeDirectory = "/root";
      stateVersion = config.system.stateVersion;
    };
  };

}

