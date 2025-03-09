{
  description = "Flake for my desktop";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf.url = "github:notashelf/nvf";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs =
    { self
    , nixpkgs
    , home-manager
    , nvf
    , zen-browser
    , ...
    }@inputs:
    let
      system = "x86_64-linux";
      secrets = builtins.fromJSON (builtins.readFile "${self}/.secrets/secrets.json");
    in
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
      nixosConfigurations = {
        cooper = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit secrets; };
          modules = [
	    nvf.nixosModules.default
            ./hosts/cooper/configuration.nix
	    ./nvf-configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.users.cooper = import ./hosts/cooper/home.nix;
              home-manager.extraSpecialArgs = { zen-browser = zen-browser.packages."${system}".default; inherit system; };
            }
          ];
        };
      };
    };
}
