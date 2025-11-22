{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    bind = [
      # Programs
      "$mod, Z, exec, zenbrowser"
      "CTRL_SHIFT, grave, exec, kitty"
      "$mod, R, exec, rofi -show drun -show-icons"
      "$mod, F, exec, kitty yazi"
      "$mod, S, exec, steam"

      # Move windows
      "CTRL, Left, movewindow, l"
      "CTRL, Right, movewindow, r"
      "CTRL, Up, movewindow, u"
      "CTRL, Down, movewindow, d"

      # Swap windows
      "CTRL_ALT, Left, swapwindow, l"
      "CTRL_ALT, Right, swapwindow, r"
      "CTRL_ALT, Up, swapwindow, u"
      "CTRL_ALT, Down, swapwindow, d"

      # Move focus
      "ALT, Left, movefocus, l"
      "ALT, Right, movefocus, r"
      "ALT, Up, movefocus, u"
      "ALT, Down, movefocus, d"

      # PC hotkeys
      "CTRL_ALT, F, fullscreen"
      "$mod, L, exec, hyprlock"
      "CTRL, Q, killactive"
      "CTRL, Print, exec, grimblast save area"
      "$mod, Print, exec, grimblast save screen"
      "CTRL_SHIFT, S, movetoworkspace, special:magic"

      # Workspaces
      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"
      "$mod, 6, workspace, 6"
      "$mod, 7, workspace, 7"
      "$mod, 8, workspace, 8"
      "$mod, 9, workspace, 9"
      "$mod, 0, workspace, 0"

      # Move to workspace
      "$mod SHIFT, 1, movetoworkspace, 1"
      "$mod SHIFT, 2, movetoworkspace, 2"
      "$mod SHIFT, 3, movetoworkspace, 3"
      "$mod SHIFT, 4, movetoworkspace, 4"
      "$mod SHIFT, 5, movetoworkspace, 5"
      "$mod SHIFT, 6, movetoworkspace, 6"
      "$mod SHIFT, 7, movetoworkspace, 7"
      "$mod SHIFT, 8, movetoworkspace, 8"
      "$mod SHIFT, 9, movetoworkspace, 9"
      "$mod SHIFT, 0, movetoworkspace, 10"
    ];
  };
}
