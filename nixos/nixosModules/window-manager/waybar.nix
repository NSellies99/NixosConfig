{ pkgs, ... }:
{
  home.packages = with pkgs; [
    waybar
    font-awesome
  ];
}
