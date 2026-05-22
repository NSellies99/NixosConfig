{
  flake.nixosModules.git = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.gh
      pkgs.git-crypt
      pkgs.gnupg
      pkgs.pinentry-qt
      pkgs.pre-commit
      pkgs.cabal-install
      pkgs.ghc
    ];
    
    programs.git = {
      enable = true;
      userEmail = "mail@nielssellies.nl";
      userName = "Niels";
      extraConfig.init.defaultBranch = "main";
    };
  };
}
