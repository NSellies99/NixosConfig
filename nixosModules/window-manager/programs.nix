{ pkgs, ...} :
{
  environment.systemPackages = with pkgs; [
    rofi-wayland
    libnotify
    dunst
    hyprlock
    hyprpaper
  ];
}
