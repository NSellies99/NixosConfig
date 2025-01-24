{ pkgs, ... }:
{
  # Install kitty for default config
<<<<<<< HEAD
  environment.systemPackages = [
    pkgs.kitty
    pkgs.waybar
=======
  environment.systemPackages = with pkgs; [
    kitty
>>>>>>> e41bb53 (Big commit after moving config)
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
<<<<<<< HEAD
=======
    # Flickering electron apps
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
>>>>>>> e41bb53 (Big commit after moving config)
  };
}
