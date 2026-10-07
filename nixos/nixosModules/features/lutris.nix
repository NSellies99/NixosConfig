{
  flake.nixosModules.lutris = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.lutris
    ];
  };
}
