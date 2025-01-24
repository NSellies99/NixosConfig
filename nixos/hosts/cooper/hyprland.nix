{
  inputs,
  hyprland,
  pkgs,
  ...
}:

{
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
  };

  environment.sessionVariables = {
    XDG_CONFIG_HOME = "$HOME/etc"; 
  };
}
