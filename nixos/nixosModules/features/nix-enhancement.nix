{
  flake.nixosModules.nix-enhancement = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.nh
    ];
  };
}
