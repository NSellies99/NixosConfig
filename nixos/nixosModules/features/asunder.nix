{
  flake.nixosModules.asunder = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.asunder
    ];
  };
}