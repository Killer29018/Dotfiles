{ configs, pkgs, ... } :
{
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        consoleMode = "2";
      };
    };
  };

  services = {
    xserver = {
      xrandrHeads = [
        "eDP-1" {
          output = "eDP-1";
          primary = true;
        }
        {
          monitorConfig = ''
            DisplaySize 1920 1080
            '';
          output = "eDP-1";
        }
      ];

      displayManager = {
        # setupCommands = ''
        #   xrandr --output eDP-1 --primary --mode 1920x1080 --rate 90
        #   '';
        sddm = {
          enable = true;
          enableHidpi = false;
          theme = "breeze";

          settings = {
            X11 = {
              server = "-dpi 178";
            };
          };
        };
      };
    };
  };

  environment.systemPackages = with pkgs; [
    maliit-keyboard
    maliit-framework
  ];

}
