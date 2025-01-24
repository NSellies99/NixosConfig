{ pkgs, ... }:
{
  # Install kitty for default config
  environment.systemPackages = with pkgs; [
    kitty
  ];

  # Enable hyprland and support nvidia
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.sessionVariables = {
    # Fixes cursor invisibility issue
    WLR_NO_HARDWARE_CURSOR = "1";
    # Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
    # Flickering electron apps
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
  };
}
