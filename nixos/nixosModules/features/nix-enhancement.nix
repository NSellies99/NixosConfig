{
  flake.nixosModules.nixEnhancement = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.nh
    ];
  };
}
