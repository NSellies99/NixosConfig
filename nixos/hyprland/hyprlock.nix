{ ... }:
{
  programs.hyprlock = {
    enable = true;
    settings = {
      background = {
        monitor = "";
        path = "$HOME/.config/wallpapers/assets/space_station.webp";
      };

      input-field = {
        monitor = "";
        size = "400, 90";
        outline_thickness = 3;
        dots_size = 0.2;
        dots_spacing = 0.15;
        dots_center = true;
        dots_rounding = -1;
        dots_text_format = "";
        outer_color = "rgba(249, 104, 21, 1.0)";
        inner_color = "rgba(200, 200, 200, 1.0)";
        font_color = "rgba(249, 104, 21, 10)";
        font_family = "miracode";
        fade_on_empty = true;
        fade_timeout = 2000;
        placeholder_text = "<i>Input password...</i>";
        hide_input = false;
        rouding = -1;
        check_color = "rgba(249, 104, 21, 1.0)";
        fail_color = "rgba(255, 105, 97, 1.0)";
        fail_text = "<i>$FAIL<b>($ATTEMPTS)</b></i>";
        fail_timeout = 1000;
        caplock_color = "";
        numlock_color = "";
        bothlock_color = "";
        position = "0, 300";
        valign = "none";
        halign = "center";
        zindex = 0;
      };
    
      image = {
        monitor = "";
        path = "$HOME/Pictures/ProfilePics/Cooper_pfp.png";
        size = 150;
        rounding = -1;
        bordering_size = 3;
        border_color = "rgba(249, 104, 21, 1.0)";
        rotate = 0;
        reload_time = -1;
        reload_cmd = "";
        position = "0, 0";
        halign = "center";
        valign = "center";
        zindex = 0;
      };

      label = {
        monitor = "";
        text = "$USER";
        valign = "bottom";
        halign = "right";
        font_family = "miracode";
        font_size = 30;
        position = "-70, 140";
        font_color = "rgba(200, 200, 200, 1.0)";
      };
    };
  };
}
