{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Nix enhancement
    deadnix
    nh

    # File management
    zip
    unzip
    p7zip

    # Office
    libreoffice-qt
    hunspell
    hunspellDicts.en_US
    hunspellDicts.nl_nl

    # Productivity  
    neovim
    planify
    obsidian

    # All round
    grimblast
    clamav
    thunderbird
    gimp
    keepass

    # Media
    vlc
  ];
}
