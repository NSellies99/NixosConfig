{
  flake.nixosModules.gpodder = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.gpodder
    ];
  };
}
