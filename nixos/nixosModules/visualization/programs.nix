{ pkgs, ... }:
{
  home.packages = with pkgs; [
    rofi-wayland
    libnotify
    hyprlock
    swww
    wlogout
  ];
}
