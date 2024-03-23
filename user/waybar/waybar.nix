{ config, pkgs, ... }:
{
  programs.waybar = {
    enable = true;

    settings = [{
      layer = "top";
      position = "top";
      height = 24;

      modules-left = [
        "custom/padding"
        "custom/dome-left"
        "hyprland/workspaces"
        "custom/dome-right"
      ];

      modules-center = [
        "custom/dome-left"
        "clock#1"
        "clock#2"
        "clock#3"
        "custom/dome-right"
      ];

      modules-right = [
        "custom/dome-left"
        "pulseaudio"
        "memory"
        "cpu"
        "battery"
        "disk"
        # "tray"
        "custom/dome-right"
        "custom/padding"
      ];

      "custom/padding" = {
        format = "  ";
        tooltip = false;
      };

      "custom/dome-left" = {
        format = "";
        tooltip = false;
      };

      "custom/dome-right" = {
        format = "";
        tooltip = false;
      };

      "hyprland/workspaces" = {
        format = "{name}";
        persistent-workspaces = {
          "1" = [];
          "2" = [];
          "3" = [];
        };
      };

      "clock#1" = {
        format = "{:%a}";
        tooltip = false;
      };

      "clock#2" = {
        format = "{:%H:%M:%S}";
        tooltip = false;
      };

      "clock#3" = {
        format = "{:%d-%m}";
        tooltip = false;
      };

      pulseaudio = {
        format = "{icon} {volume:2}%";
        format-bluetooth = "{icon} {volume}%_";
        format-muted = "MUTE";
        format-icons = {
          headphones = "";
          default = [
            ""
            ""
          ];
        };
        scroll-step = 5;
        on_click = "pamixer -t";
        on-click-right = "pavucontrol";
      };

      memory = {
        interval = 5;
        format = "Mem {}%";
      };

      cpu = {
        interval = 5;
        format = "CPU {usage:2}%";
      };

      battery = {
        states = {
          good = 95;
          warning = 30;
          critical = 15;
        };
        format = "{icon} {capacity}%";
        format-icons = [
          ""
          ""
          ""
          ""
          ""
        ];
      };

      disk = {
        interval = 5;
        format = "Disk {percentage_used:2}%";
        path = "/";
      };

      tray = {
        icon-size = 20;
      };
    }];

    style = ''
      * {
        font-size: 20px;
        font-family: monospace;
      }

      window#waybar {
        background: transparent;
        color: #fdf6e3;
      }

      #custom-padding {
        background: transparent;
      }

      #custom-dome-right,
      #custom-dome-left {
        color: #1a1a1a;
      }

      #workspaces,
      #clock.1,
      #clock.2,
      #clock.3,
      #pulseaudio,
      #memory,
      #cpu,
      #battery,
      #disk,
      #tray {
        background: #1a1a1a;
      }

      #workspaces button {
        padding: 0 2px;
        color: #fdf6e3;
      }

      #workspaces button.active {
        color: #268bd2;
      }

      #workspaces button:hover {
        box-shadow: inherit;
        text-shadow: inherit;

        background: #1a1a1a;
        border: #1a1a1a;
        padding: 0 3px;
      }

      #pulseaudio {
        color: #268bd2;
      }

      #memory {
        color: #2aa198;
      }

      #cpu {
        color: #6c71c4;
      }

      #battery {
        color: #859900;
      }

      #disk {
        color: #b58900;
      }

      #clock,
      #pulseaudio,
      #memory,
      #cpu,
      #battery,
      #disk {
        padding: 0 10px;
      }

    '';
  };
}