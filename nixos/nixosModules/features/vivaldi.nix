{
  flake.nixosModules.vivaldi = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.vivaldi
    ];
  };
}
