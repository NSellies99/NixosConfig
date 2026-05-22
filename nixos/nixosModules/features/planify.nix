{
  flake.nixosModules.planify = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.planify
    ];
  };
}
