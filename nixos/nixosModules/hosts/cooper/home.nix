{self, inputs, ... }:
{
  flake.homeConfiguration.cooper = inputs.home-manager.lib.homeManagerConfiguration {
    pks = import inputs.nixpkgs { system = "x86_64-linux"; };
    modules = [
      self.homeModules.cooper {
        home.username = "cooper";
        home.homeDirectory = "/home/cooper";
      }
    ];
  };

  flake.homeModules.cooper = { pkgs, ... }:
  {
    enableNixpkgsReleaseCheck = false;
    sessionVariables = { STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d"; };
    home.packages = [ pkgs.protonup-ng ];

    services = {
      gpg-agent = {
        enable = true;
        pinentry.pkgs = pkgs.pinentry;
      };
    };

    programs.git = {
      enable = true;
      userEmail = "mail@nielssellies.nl";
      userName = "Niels";
    
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };
}
