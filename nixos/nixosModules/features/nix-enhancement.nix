{
  flake.nixosModules.nix = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.nh
    ];
  };
}
