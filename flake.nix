{
  description = "Flake for my desktop";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    
    home-manager = 
    {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs: 
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs
    {
      inherit system;
      config =
      {
        allowUnfree = true;
      };
    };
  in
  {
    nixosConfigurations = 
    {
      cooper = nixpkgs.lib.nixosSystem
      {
        inherit system;
        modules = 
        [         
          ./hosts/cooper/configuration.nix 
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
           
            home-manager.users.cooper = import ./hosts/cooper/home.nix;          
          }
        ];
      }; 
    }; 
  };
}
