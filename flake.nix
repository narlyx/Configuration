{

  # Flake inputs
  inputs = {

    # Package repositories
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Flake utilities
    haumea.url = "github:nix-community/haumea/v0.2.2";
    agenix.url = "github:ryantm/agenix";

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

        # Secrets
        inputs.agenix.nixosModules.default
        ({ pkgs, ... }: {
          environment.systemPackages = [
            inputs.agenix.packages.${pkgs.stdenv.hostPlatform.system}.default
          ];
        })
        
      ];
    };

  in {

    # Automatically create NixOS hosts from hosts tree
    nixosConfigurations = nixpkgs.lib.mapAttrs (name: _type: mkHost name) hosts;

  };

}
