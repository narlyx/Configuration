{ inputs, homeModules, ... }: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inputs = inputs;
      homeModules = homeModules;
    };
    backupFileExtension = "bak";
  };
}
