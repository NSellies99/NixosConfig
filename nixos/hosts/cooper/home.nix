{ pkgs, zen-browser, ... }:
let
  settings = builtins.fromJSON (builtins.readFile (./. + "/settings.json"));
  username = settings.user.username;
  dotfilesPath = ../../../.config;
in
{
  home = {
    # User values
    inherit username;
    homeDirectory = "/home/${username}";

    # Home manager version
    enableNixpkgsReleaseCheck = false;
    stateVersion = "24.11";

    pointerCursor = import ../../home/cursor.nix ({ inherit pkgs; cursor = settings.cursor; });

    # For enabling proton
    sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    };

    file = {
      ".config/hypr".source = dotfilesPath + /hypr;
      ".config/waybar".source = dotfilesPath + /waybar;
      ".config/wallpapers".source = dotfilesPath + /wallpapers;
    };


    packages = with pkgs; [
      protonup
      zen-browser
    ];
  };

  imports = [
    ../../nixosModules/common
    ../../nixosModules/terminal
    ../../nixosModules/neovim
    ../../hyprland
    ../../nixosModules/programming
  ];

  services = {
    gpg-agent = {
      enable = true;
      pinentry.package = pkgs.pinentry-qt;
    };
  };

  programs = {
    home-manager = {
      enable = true;
    };

    # Configure git
    git = {
      enable = true;
      userEmail = "mail@nielssellies.nl";
      userName = "Niels";

      # Set some safe directories for uploading config to git
      extraConfig = {
        init.defaultBranch = "main";
        safe.directory = "/etc/nixos/";
        safe.dictory = "/home/${username}/.nix-config";
      };
    };
  };
}
