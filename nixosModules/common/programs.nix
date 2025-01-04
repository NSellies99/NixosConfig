{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Nix enhancement
    deadnix
    nh

    # File management
    zip

    # Office
    libreoffice-qt
    hunspell
    hunspellDicts.en_US
    hunspellDicts.nl_nl
  ];
}
