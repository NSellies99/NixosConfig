{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Nix enhancement
    deadnix
    nh

    # File management
    zip
    unzip

    # Office
    libreoffice-qt
    hunspell
    hunspellDicts.en_US
    hunspellDicts.nl_nl
  ];
}
