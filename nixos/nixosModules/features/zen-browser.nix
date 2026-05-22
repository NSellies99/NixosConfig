{
  flake.nixosModules.zen-browser = {zen-browser, ...}: {
    environment.systemPackages = [
      zen-browser
    ];
  };
}
