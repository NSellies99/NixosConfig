{
  flake.nixosModules.terminal = {pkgs, lib, ...}: {
    environment.systemPackages = [
      pkgs.nerdfetch
      pkgs.yazi
    ];

    programs = {
      starship.enable = true;
      fish.enable = true;
      kitty = lib.mkForce {
        enable = true;
        settings = {
          font_family = "MiraCode";
          background_opacity = "0.7";
        };
        extraConfig = "shell fish";
      };
    };
  };
}
