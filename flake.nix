{

  ### FLAKE INPUTS ###
  inputs = {

    # Nix repo
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-flatpak.url = "github:NixOS/nixpkgs/51effaf9783e0226281ad10e95a4af6c8a145316";

    # Hardware support
    nixos-hardware.url = "github:nixos/nixos-hardware";

    # Flake utilities
    haumea.url = "github:nix-community/haumea";
    agenix.url = "github:ryantm/agenix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Apps
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    helium = {
      url = "github:AlvaroParker/helium-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  ### FLAKE OUTPUTS ###
  outputs = inputs@{ self, nixpkgs, haumea, ... }: let
   
    # Nix modules
    nixModules = haumea.lib.load {
      src = ./modules;
      loader = haumea.lib.loaders.path;
    };

    # Home modules
    homeModules = haumea.lib.load {
      src = ./home;
      loader = haumea.lib.loaders.path;
    };

    # Dynamically create new hosts via host name 
    mkHost = hostName: nixpkgs.lib.nixosSystem {
      
      # Passing vars
      specialArgs = { inherit inputs nixModules homeModules; };

      # Additional config
      modules = [

        # Define hostname
        { networking.hostName = hostName; }

        # Universal configuration
        nixModules.all-hosts

        # Configuration file
        ./hosts/${hostName}/configuration.nix

      ];
    };

  in {

    # Automatically create NixOS hosts from ./hosts
    nixosConfigurations = nixpkgs.lib.mapAttrs (hostName: _type: mkHost hostName) (haumea.lib.load {
      src = ./hosts;
      loader = haumea.lib.loaders.path;
    });

  };

}


