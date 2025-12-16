{ pkgs, ... }:
{
  programs.waybar.settings = {
    "sway/workspaces" = {
      all-outputs = true;
      format = "{icon}";
      format-icons = {
        "1" = "";
        "2" = "";
        "3" = "";
      };
    };
    "custom/swap" = {
      on-click = pkgs.writeShellScript "swap-background.sh" ''
        backgrounds_dir="../wallpapers"
        
        background_count=$(ls $backgrounds_dir -1 | wc -l)
        backgrounds=$("$backgrounds_dir"*)

        new_background_idx=$(($RANDOM % $background_count))
        new_background=$($backgrounds[$new_background_idx])
        swww img $($new_background) --transition-type left --transition-fps 60
      '';
      format = "";
      tooltip = false;
    };
    "clock" = {
      tooltip-format = "<tt><small>{calendar}</small></tt>";
      calendar = {
        mode = "month";
        mode-mon-cols = 3;
        week-pos = "left";
      };
      actions = {
        on-click-right = "mode";
      };
      format = "<span rise=\"2pt\"></span> {:%a %d %b | %H:%M}";
      format-alt = "<span rise=\"2pt\"></span> {:%Y-%m-%d | %H:%M:%S}";
    };
    "custom/launcher" = {
      format = "󱄅";
      on-click = "rofi -show drun";
      tooltip = false;
    };
    "custom/power" = {
      format = "⏻";
      on-click = "wlogout -p layer-shell";
      tooltip = false;
    };
    "network" = {
      format = "<span rise=\"2pt\">󱚼</span> Disabled";
      format-wifi = "<span rise=\"2pt\">󰖩</span> {essid}";
      format-ethernet = "<span rise=\"2pt\">󰈀</span> {ifname}: {ipaddr}/{cidr}";
      format-disconnected ="<span rise=\"2pt\"></span> Disconnected";
      on-click = "nm-connection-editor";
    };
    "pulseaudio" = {
      format = "{volume}% <span rise=\"2pt\"></span>";
      on-click = "pwvucontrol";
    };
  };
}
