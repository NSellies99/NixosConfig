{
  flake.nixosModules.pc-functionality = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.grimblast
      pkgs.pwvucontrol
      pkgs.openssl
    ];
  };
}
