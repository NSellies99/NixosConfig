{
  flake-parts.nixosModules.nix = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.thunderbird
      pkgs.protonmail-bridge
    ];
  };
}
