{ pkgs, ... }:
let
  username = "cooper"; 
in
  {
    home =
    {
      # User values
      inherit username;
      homeDirectory = "/home/${username}";
    
      # Home manager version
      enableNixpkgsReleaseCheck = false;
      stateVersion = "24.11";

      packages = with pkgs;
      [
        protonup
        git
        git-crypt
        gnupg
        pinentry-qt
      ];
      
      # For enabling proton
      sessionVariables =
      {
        STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
      };
    };
    
    services =
    {
      gpg-agent =
      {
        enable = true;
        pinentryPackage = pkgs.pinentry-qt;
      };
    };
     
    programs =
    {
      home-manager =
      {
        enable = true;
      };
      
      # Configure git
      git =
      {
        enable = true;
        userEmail = "mail@nielssellies.nl";
        userName = "Niels";
        
        # Set some safe directories for uploading config to git
        extraConfig =
        {
          init.defaultBranch = "main";
          safe.directory = "/etc/nixos/";
          safe.dictory = "/home/${username}/.dotfiles";
      };
    };
  };
}
