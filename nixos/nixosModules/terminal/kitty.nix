{ lib, ... }:

{
  programs.kitty = lib.mkForce {
    enable = true;

    # Visual
    settings = {
      font_family = "Miracode";
      background_opacity = "0.7";
    };

    extraConfig = "shell fish";
  };
}
