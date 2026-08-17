{
  flake.nixosModules.git = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.gh
      pkgs.git-crypt
      pkgs.gnupg
      pkgs.pinentry-qt
      pkgs.pre-commit
      pkgs.cabal-install
      pkgs.ghc
      pkgs.git
    ];
  };
}
