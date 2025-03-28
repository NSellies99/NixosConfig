{ lib, ... }:

{
  programs.kitty = lib.mkForce {
    enable = true;

    # Visual
    settings = {
      background_opacity = "0.7";
    };

    extraConfig = "shell fish";
  };
}
