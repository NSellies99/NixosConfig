{ ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "bottom";
        position = "top";
        height = 30;
        margin = "0 0 0 0";
        modules-left = [
          "custom/launcher"
          "sway/workspaces"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "pulseaudio"
          "temperature"
          "network"
          "custom/power"
        ];
      };
    };
  };
}
