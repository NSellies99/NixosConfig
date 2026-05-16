{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # File management
    zip
    unzip
    p7zip

    # Coding
    vscode

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
    ardour
  ];
}
