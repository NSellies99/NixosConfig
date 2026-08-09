{
  inputs = {
    nixpkgs.url = "https://flakehub.com/f/DeterminateSystems/nixpkgs-26.05-chilled/0.1";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nvf, ...}:
    let
      system = "x86_64-linux";

      # Get secrets from local file
      secrets = builtins.fromJSON (builtins.readFile "${self}/.secrets/secrets.json");
    in
    {
      # Nix formatter
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;

      # Configurations
      nixosConfigurations = {
        cooper = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit secrets; };

          modules = [
            ./nixosModules/hosts/cooper/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.users.cooper = import ./nixosModules/hosts/cooper/home.nix;

              home-manager.sharedModules = [ nvf.homeManagerModules.default ];

              home-manager.backupFileExtension = "backup";
            }
          ];
        };
      };
    };
}
