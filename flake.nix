{

  # Flake inputs
  inputs = {

    # Package repositories
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Utilities
    haumea.url = "github:nix-community/haumea";
    agenix.url = "github:ryantm/agenix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

  };

  # Flake outputs
  outputs = inputs@{ self, nixpkgs, haumea, ... }: let

    # Create modules tree
    modules = haumea.lib.load {
      src = ./modules;
      loader = haumea.lib.loaders.path;
    };

    # Create hosts tree
    hosts = haumea.lib.load {
      src = ./hosts;
      loader = haumea.lib.loaders.path;
    };

    # Function to create a new host based on host name
    mkHost = name: nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs modules; };
      modules = [

        # Predefined hostname
        { networking.hostName = name; }

        # Host configuration files
        ./hosts/${name}/default.nix

        # Universal configuration
        modules.roles.base

      ];
    };

  in {

    # Automatically create NixOS hosts from hosts tree
    nixosConfigurations = nixpkgs.lib.mapAttrs (name: _type: mkHost name) hosts;

  };

}
