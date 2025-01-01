{ pkgs, ... }:

{
  home.packages = with pkgs;
  [
    # Nix enhancement
    deadnix
    nh
    nixfmt
    
    # File management
    zip

    # Office
    libreoffice-qt
    hunspell
    hunspellDicts.en_US
    hunspellDicts.nl_nl
  ];
}

