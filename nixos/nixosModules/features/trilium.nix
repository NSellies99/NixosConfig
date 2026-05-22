{
  flake.nixosModules.trilium = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.trilium-desktop
    ];
  };
}
