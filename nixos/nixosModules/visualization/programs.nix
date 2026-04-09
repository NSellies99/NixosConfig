{ pkgs, ... }:
{
  home.packages = with pkgs; [
    rofi
    libnotify
    hyprlock
    swww
    wlogout
  ];
}
