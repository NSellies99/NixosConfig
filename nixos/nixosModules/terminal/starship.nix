{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pkgs.starship
  ];

  programs.starship = {
    enable = true;
  };
}
