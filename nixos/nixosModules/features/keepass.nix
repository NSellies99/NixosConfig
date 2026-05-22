{
  flake.nixosModules.keepass = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.keepass
    ];
  };
}
