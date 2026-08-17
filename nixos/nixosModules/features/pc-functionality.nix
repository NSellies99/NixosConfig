{
  flake.nixosModules.pcFunctionality = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.grimblast
      pkgs.pwvucontrol
      pkgs.openssl
    ];
  };
}
