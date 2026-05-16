{
  flake-parts.nixosModules.nix = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.libreoffice-qt
      pkgs.hunspell
      pkgs.hunspellDicts.en_US
      pkgs.hunspellDicts.nl_nl
    ];
  };
}
