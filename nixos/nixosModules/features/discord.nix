{
  flake.nixModules.discord = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.vesktop
    ];
  };
}
