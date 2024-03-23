{ config, pkgs, ... }:
let
  startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
    waybar &
    swww init &

    sleep 1

    ./home/aaron/.dotfiles/scripts/RandomBackground.sh &
  '';
in
{
  home.file."${config.xdg.configHome}/hypr" = {
    source = ./hypr;
    recursive = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      exec-once = [
        "${startupScript}/bin/start"
      ];

      "$terminal" = "alacritty";
      "$fileManager" = "dolphin";
      "$menu" = "wofi --show drun";

      source = "~/.config/hypr/catppuccin_macchiato.conf";

      general = {
        monitor = "eDP-1, 2880x1800@90, 0x0, 1.8";
        border_size = 2;
        gaps_out = 10;
        gaps_in = 5;

        "col.active_border" = "rgb(580C82) rgb(8F30A1) rgb(FE4773) rgb(F6D68D) rgb(46B3A5) rgb(2E6D92) 45deg";
        "col.inactive_border" = "rgb(580C82) rgb(8F30A1) rgb(FE4773) rgb(F6D68D) rgb(46B3A5) rgb(2E6D92) 45deg";

        layout = "master";
      };

      input = {
        kb_layout = "gb";
        touchpad = {
          natural_scroll = "yes";
        };
      };

      bezier = [
        "wind, 0.05, 0.9, 0.1, 1.05"
        # "winIn, 0.1, 1.1, 0.1, 1.1"
        # "winOut, 0.3, -0.3, 0, 1"
        # "liner, 1, 1, 1, 1"
        "linear, 0.0, 0.0, 1.0, 1.0"
      ];

      animations = {
        enabled = true;
        animation = [
          "windowsMove, 1, 5, wind, slide"
          "border, 1, 10, default"
          "borderangle, 1, 500, linear, loop"
          # "fade, 1, 10, default"
          # "workspaces, 1, 5, wind"
          # "windows, 1, 6, wind, slide"
          ];
      };

      decoration = {
        rounding = "10";

        active_opacity = 0.95;
        inactive_opacity = 0.8;

        blur = {
          enabled = "true";
          size = "3";
          passes = "1";
        };

        drop_shadow = "yes";
        shadow_range = "4";
      };

      gestures = {
        workspace_swipe = "on";
      };

      bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];

      binde = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

        ", XF86MonBrightnessUp, exec, brightnessctl s +10"
        ", XF86MonBrightnessDown, exec, brightnessctl s 10- -n 10"
      ];

      bind = [
        "SUPER, RETURN, exec, $terminal"
        "SUPER SHIFT, Q, killactive"
        "SUPER, SPACE, togglefloating"
        "SUPER, E, exec, $fileManager"
        "SUPER, R, exec, $menu"
        "SUPER, F, fullscreen"
        "SUPER, M, exit"

        "SUPER, left,  movefocus, l"
        "SUPER, right, movefocus, r"
        "SUPER, up,    movefocus, u"
        "SUPER, down,  movefocus, d"

        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER, 6, workspace, 6"
        "SUPER, 7, workspace, 7"
        "SUPER, 8, workspace, 8"
        "SUPER, 9, workspace, 9"
        "SUPER, 0, workspace, 10"

        "SUPER SHIFT, 1, movetoworkspace, 1"
        "SUPER SHIFT, 2, movetoworkspace, 2"
        "SUPER SHIFT, 3, movetoworkspace, 3"
        "SUPER SHIFT, 4, movetoworkspace, 4"
        "SUPER SHIFT, 5, movetoworkspace, 5"
        "SUPER SHIFT, 6, movetoworkspace, 6"
        "SUPER SHIFT, 7, movetoworkspace, 7"
        "SUPER SHIFT, 8, movetoworkspace, 8"
        "SUPER SHIFT, 9, movetoworkspace, 9"
        "SUPER SHIFT, 0, movetoworkspace, 10"
      ];
    };
  };
}
