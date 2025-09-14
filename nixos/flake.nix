{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs = { self, nixpkgs, home-manager, nvf, zen-browser, ...}:
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
            ./hosts/cooper/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.users.cooper = import ./hosts/cooper/home.nix;

              home-manager.sharedModules = [ nvf.homeManagerModules.default ];

              home-manager.backupFileExtension = "backup";
              home-manager.extraSpecialArgs = {
                zen-browser = zen-browser.packages."${system}".default;
                inherit system;
              };
            }
          ];
        };
      };
    };
}
