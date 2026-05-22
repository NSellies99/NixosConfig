{
  flake.nixosModules.mail = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.thunderbird
      pkgs.protonmail-bridge
    ];
  };
}
