{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gh
    git-crypt
    gnupg
    pinentry-qt
  ];

  programs.git =
  {
    enable = true;
  };
}
