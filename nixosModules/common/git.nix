{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gh
    git-crypt
    gnupg
    pinentry-qt
    pre-commit
    cabal-install
    ghc
  ];

  programs.git = {
    enable = true;
  };
}
