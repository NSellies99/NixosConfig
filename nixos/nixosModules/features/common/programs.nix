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

    # Coding
    vscode

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
    yazi
    nerdfetch
    rawtherapee
    openssl
    nmap
    protonmail-bridge

    # Media
    vlc
    pwvucontrol
  ];
}
