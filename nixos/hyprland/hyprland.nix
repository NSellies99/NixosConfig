{ ... }:
{
  # Install kitty for default config
  programs.kitty.enable = true;

  # Enable hyprland for home manager and support nvidia
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  home.sessionVariables = {
    # Fixes cursor invisibility issue
    WLR_NO_HARDWARE_CURSOR = "1";
    # Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
    # Flickering electron apps
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
  };
}
