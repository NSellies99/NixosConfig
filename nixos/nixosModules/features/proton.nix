{
  flake.nixosModules.protonVpn = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.proton-vpn
    ];
  };
}
