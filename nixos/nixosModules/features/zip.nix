{
  flake-parts.nixosModules.nix = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.zip
      pkgs.unzip
      pkgs.p7zip
    ];
  };
}
