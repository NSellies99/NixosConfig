{
  flake.nixosModules.steam = {pkgs, ...}: {
    programs = {
      gamemode.enable = true;
      gamescope.enable = true;
      steam = {
        enable = true;
        protontricks.enable = true;
      };
    };
  };
}
