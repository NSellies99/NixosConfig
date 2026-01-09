{ pkgs, zen-browser, ... }:
let
  settings = builtins.fromJSON (builtins.readFile (./. + "/settings.json"));
  username = settings.user.username;
in
{
  home = {
    # User values
    inherit username;
    homeDirectory = "/home/${username}";

    # Home manager version
    enableNixpkgsReleaseCheck = false;
    stateVersion = "24.11";

    # Get cursor loaded from settings
    pointerCursor = import ../../visualization/cursor.nix ({ inherit pkgs; cursor = settings.cursor; });

    # For enabling proton
    sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    };

    packages = with pkgs; [
      protonup
      zen-browser
    ];
  };

  imports = [
    ../../features/common
    ../../features/terminal
    ../../features/neovim
    ../../features/programming
    ../../visualization
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
  };
}
