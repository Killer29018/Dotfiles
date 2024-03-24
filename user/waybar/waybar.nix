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

      modules-right = [
        "custom/dome-left"
        "network"
        "pulseaudio"
        "memory"
        "cpu"
        "battery"
        "temperature"
        "backlight"
        "clock"
        "custom/dome-right"
        "custom/padding"
      ];

      "custom/padding" = {
        format = " ";
        tooltip = false;
      };

      "custom/dome-left" = {
        format = " ";
        tooltip = false;
      };

      "custom/dome-right" = {
        format = " ";
        tooltip = false;
      };

      "hyprland/workspaces" = {
        format = "{name}";
        persistent-workspaces = {
          "1" = [];
          "2" = [];
          "3" = [];
          "4" = [];
          "5" = [];
          "6" = [];
          "7" = [];
          "8" = [];
          "9" = [];
        };
      };

      clock = {
        format = "{:%d-%m %H:%M:%S}";
        interval = 1;
        tooltip = true;
        timezone = "GB";
        tooltip-format = "<tt><small>{calendar}</small></tt>";

        calendar = {
          mode = "month";
          on-click = "mode";
        };

        actions = {
          on-scroll-up = "shift_up";
          on-scroll-down = "shift_down";
        };
      };

      network = {
        interval = 2;
        format-disconnected = "󱚼";
        format = "{bandwidthUpBytes} {bandwidthDownBytes}";
        tooltip = true;
        tooltip-format-wifi = "{essid} {signalStrength}%";
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
        format = " {}%";
      };

      cpu = {
        interval = 5;
        format = " {usage:2}%";
      };

      battery = {
        states = {
          good = 95;
          warning = 30;
          critical = 15;
        };
        format = "{capacity:2}% {icon} ";
        format-icons = [
          ""
          ""
          ""
          ""
          ""
        ];
        format-alt = "{time}";
      };

      backlight = {
        interval = 5;
        format = "{percent}% {icon}";
        format-icons = [
          ""
          ""
          ""
          ""
          ""
          ""
          ""
          ""
          ""
        ];
        tooltip = false;
      };

      temperature = {
        interval = 5;
        format = "{icon} {temperatureC}°C";
        format-icons = [
          ""
        ];
        tooltip = false;
        on-click = "/home/aaron/.dotfiles/scripts/RandomBackground.sh";
      };

    }];

    style = ''
      * {
        font-size: 20px;
        font-family: monospace;
      }

      window#waybar {
        background: transparent;
      }

      #custom-padding {
        background: transparent;
      }

      #custom-dome-right,
      #custom-dome-left {
        color: #${config.colorScheme.palette.base00};
      }

      #custom-dome-left {
        border-top-left-radius: 13px;
        border-bottom-left-radius: 13px;
      }

      #custom-dome-right {
        border-top-right-radius: 13px;
        border-bottom-right-radius: 13px;
      }

      #workspaces,
      #clock,
      #pulseaudio,
      #memory,
      #cpu,
      #battery,
      #backlight,
      #temperature,
      #custom-dome-right,
      #custom-dome-left,
      #network {
        background: #${config.colorScheme.palette.base00};
      }

      #workspaces button {
        padding: 0 2px;
        color: #${config.colorScheme.palette.base04};
      }

      #workspaces button.active {
        color: #${config.colorScheme.palette.base0D};
      }

      #workspaces button.empty {
        color: #${config.colorScheme.palette.base01};
      }

      #workspaces button:hover {
        box-shadow: inherit;
        text-shadow: inherit;

        background: #${config.colorscheme.palette.base03};
        border: #${config.colorScheme.palette.base03};
        padding: 0 3px;
      }

      #pulseaudio {
        color: #${config.colorScheme.palette.base0D};
      }

      #memory {
        color: #${config.colorScheme.palette.base0C};
      }

      #battery {
        color: #${config.colorScheme.palette.base0B};
      }

      #cpu {
        color: #${config.colorScheme.palette.base0A};
      }

      #temperature {
        color: #${config.colorScheme.palette.base08};
      }

      #backlight {
        color: #${config.colorScheme.palette.base07};
      }

      #network {
        color: #${config.colorScheme.palette.base09};
      }

      #clock,
      #pulseaudio,
      #memory,
      #cpu,
      #battery,
      #cpu,
      #network,
      #temperature,
      #backlight {
        padding: 0 10px;
      }

    '';
  };
}
