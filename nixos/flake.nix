{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    import-tree.url = "github:vic/import-tree";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs = inputs: 
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = ["x86_64-linux"];
    }
    (inputs.import-tree ./nixosModules);
}
