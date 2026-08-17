{
  flake.nixosModules.nicotine = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.nicotine-plus
    ];
  };
}
