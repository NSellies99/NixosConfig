{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    rofi-wayland
    libnotify
    hyprlock
    hyprpaper
  ];
}
