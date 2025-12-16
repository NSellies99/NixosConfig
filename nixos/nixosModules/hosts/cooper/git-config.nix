{ ... }:
{
  programs.git = {
    enable = true;
    userEmail = "mail@nielssellies.nl";
    userName = "Niels";
    
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
