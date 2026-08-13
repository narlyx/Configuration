{ inputs, nixModules, homeModules, config, pkgs, ... }: {

  ### IMPORTS ###
  imports = [];
  home-manager.users.narlyx.imports = [
    homeModules.narlyx.zsh
    homeModules.narlyx.git
    homeModules.narlyx.emacs
  ];

  ### SHELL ###
  programs.zsh.enable = true;
  users.users.narlyx.shell = pkgs.zsh;

  ### SYSTEM USER ###
  users.users.narlyx = {
    description = "Narlyx";
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "vboxusers"
      "dialout"
    ];
  };

  ### HOME ENV ###
  home-manager.users.narlyx.home = {
    username = "narlyx";
    homeDirectory = "/home/narlyx";
    stateVersion = config.system.stateVersion;
  };

}

