{
  flake.nixosModules.musescore = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.musescore
    ];
  };
}
